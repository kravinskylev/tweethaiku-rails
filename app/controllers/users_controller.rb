class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
    end
  end

  def show
    @user = current_user
  end

private

  def user_params
   params.require(:user).permit(:username, :password)
  end
end
