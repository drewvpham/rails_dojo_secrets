class UsersController < ApplicationController


  def new
  end

  def create
    user=User.create(user_params)
    if user.valid?
      session[:user_id]=user.id
      redirect_to '/success'
    else
      flash[:registration_errors] = user.errors.full_messages
      redirect_to :root
    end
  end

  def success

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
