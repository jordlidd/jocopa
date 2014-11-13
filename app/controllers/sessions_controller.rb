class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:notice] = "Sign in successful."
      redirect_to user
    else
      flash.now[:error] = "Sorry. We couldn't sign you in." # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if signed_in?
    flash[:notice] = 'You are signed out'
    redirect_to root_url
  end
end
