class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :get_includes
  before_action :get_fields

  protected

  def get_includes
    @include = {}

    if params[:include]
      params[:include].split(",").each do |field|
        @include[field.to_sym] = true
      end
    end
  end

  def get_fields
    if params[:fields]
      @fields = params[:fields].split(",").map {|f| f.to_sym }
    end
  end

end
