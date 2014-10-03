class SessionsController < ApplicationController

  def new
  end


  def create
    user = User.where(email: params[:signin][:email]).first


    if user && user.authenticate(params[:signin][:password])

      session[:user_id] = user.id
      flash[:notice] = "Sign in successful."

      redirect_to user_path(user)
    else
      flash[:error] = "Sorry. We couldn't sign you in."
      render :new
    end
  end

end
