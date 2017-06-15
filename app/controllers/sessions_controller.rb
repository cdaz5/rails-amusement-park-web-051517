class SessionsController < ApplicationController

  before_action :authentication_required, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    binding.pry
    User.find_by(:name)
    if user && user.authenticate(user_params)
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
