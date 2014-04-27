class ToolsController < ApplicationController
  before_action :get_user, except: [ :index, :show ]
  before_action :get_tool, except: [ :index, :create ]

  def index
    @tools = if @include[:user]
      Tool.includes(:user).all
    else
      Tool.all
    end
  end

  def show
    @tools = [ @tool ]
    render :index
  end

  def create
    tool = @user.tools.new( tool_params )

    if tool.save
      render json: tool, status: :created, location: user_tool_url(@user, tool)
    else
      render json: tool.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tool.update_attributes (tool_params )
      render json: @tool, status: :ok
    else
      render json: @tool.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @tool.destroy
      head :no_content
    else
      head :internal_server_error
    end
  end

  protected

  def get_user
    head :bad_request unless @user = User.find( params[:user_id] )
  end

  def get_tool
    begin
      @tool = if @user
        @user.tools.find( params[:id] )
      else
        Tool.find( params[:id] )
      end
    rescue ActiveRecord::RecordNotFound => e
      head :not_found
    end
  end

  def tool_params
    params.require(:tool).permit(
      :name, :category, :description
    )
  end
end
