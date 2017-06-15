class UsersController < ApplicationController
  before_action :authentication_required, except: [:new, :index, :create]
  def index
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
  end


private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :height, :happiness, :nausea, :tickets)
  end

end
