object false

child @users do
  attrs = [ :id, :email ]

  fields = if @fields
    @fields.select {|f| attrs.include?(f) }
  else
    attrs
  end
  
  attributes *fields

  if @include[:tools]
    child :tools do |tool|
      attributes :id, :name, :category, :description
    end
  end
end
