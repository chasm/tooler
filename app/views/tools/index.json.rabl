object false

child @tools do
  attrs = [ :id, :name, :category, :description ]

  fields = if @fields
    @fields.select {|f| attrs.include?(f) }
  else
    attrs
  end

  attributes *fields

  if @include[:user]
    child :user do |user|
      attributes :id, :email
    end
  end
end
