class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to profile_url, notice: 'Login Successful'
    else
      flash.now.alert 'Invalid email or password'
      render :new
    end
  end

  def destroy
  end
end
