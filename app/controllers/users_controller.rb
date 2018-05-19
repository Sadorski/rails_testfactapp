class UsersController < ApplicationController
  def new
  end
  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
    if @user.save
      flash[:notice] = ['Welcome, shane']
      redirect_to user_path(User.last)
    else
      flash[:notice] = ["First name can't be blank", "Last name can't be blank", "email can't be blank"]
      redirect_to new_user_path
    end
  end
end
