class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

  end
  def new
    @user = User.new
  end

def edit
  @user = User.find(params[:id])
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

end
