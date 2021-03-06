class UsersController < ApplicationController
  before_filter :authenticate, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to profile_url, notice: 'Signed up'
    else
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation
    )
  end
end
