class UsersController < ApplicationController
  before_action :user_authorized, only: [:success]
  before_action :user_logged_in, only: [:new]

  def new

  end

  def create
    user=User.create(user_params)
    if user.valid?
      session[:user_id]=user.id
      redirect_to '/secrets'

    else
      flash[:registration_errors] = user.errors.full_messages
      redirect_to :root
    end

  end

  def show
    @user=User.find
  end

  def success

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
