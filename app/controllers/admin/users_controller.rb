class Admin::UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      @user.update(admin: true)
      log_in @user
      redirect_to items_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

end
