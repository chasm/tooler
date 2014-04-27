$ ->
  $.ajax "/api/users?include=tools",
    method: 'GET',
    contentType: 'application/json',
    dataType: 'json',
    success: (data) ->
      console.log data
      for user in data.users
        row = $('<tr>')
        row.append $("<td class=\"user-id\">#{user.id}</td>")
        row.append $("<td class=\"user-email\" data-user-id=\"#{user.id}\">#{user.email}</td>")
        row.append $("<td class=\"user-tools-count\">#{user.tools.length}</td>")
        $("#user-list tbody").append(row)

  $('body').on 'click', '.user-email', (e) ->
    cell = $(@)
    value = cell.html()
    userId = cell.data().userId
    cell.html(
      $("<input class=\"temp-input\" type=\"text\" name=\"user[email]\" value=\"#{value}\">")
    )
    $('.temp-input').focus()

  $('body').on 'change', '.temp-input', (e) ->
    input = $(@)
    value = input.val()
    parent = input.parent()
    userId = parent.first().data().userId
    parent.html(value)
    $.ajax "/api/users/#{userId}",
      method: 'PATCH'
      contentType: 'application/json'
      dataType: 'json'
      data: JSON.stringify( {user:{email:value}})
      success: (data) =>
        parent.html(value)
