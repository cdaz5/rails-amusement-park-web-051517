class SessionsController < ApplicationController
  include SessionsHelper
  before_action :authentication_required, except: [:new, :index, :create, :destroy]

  def index
  end

  def new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      remember(user)
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:password, :email)
  end
end
