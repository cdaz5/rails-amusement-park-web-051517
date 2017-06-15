class SessionsController < ApplicationController

  before_action :authentication_required, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
