class UsersController < ApplicationController
  before_action :get_user, except: [ :index, :create ]

  def index
    render json: User.all
  end

  def show
    render json: @user
  end

  def create
    user = User.new( user_params )

    if user.save
      render json: user, status: :created, location: user_url(user)
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update_attributes (user_params )
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      head :no_content
    else
      head :internal_server_error
    end
  end

  protected

  def get_user
    begin
      @user = User.find( params[:id] )
    rescue ActiveRecord::RecordNotFound => e
      head :not_found
    end
  end

  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation
    )
  end
end
