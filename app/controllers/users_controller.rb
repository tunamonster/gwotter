class UsersController < ApplicationController
before_action :logged_in_user, only: [:index, :edit, :update]
before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

def edit
  @user = User.find(params[:id])
end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
    flash[:succes] = "Profile updated"
    redirect_to @user
      else
    render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
      flash[:success] = "That's right nigguh it even logs you in automaticaly"
    else
      render 'new'
    end
  end

private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
