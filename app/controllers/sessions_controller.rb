class SessionsController < ApplicationController

  def new
  end


  def create
    # user = User.where(email: params[:signin][:email]).first


    # if user && user.authenticate(params[:signin][:password])

    #   session[:user_id] = user.id
    #   flash[:notice] = "Sign in successful."

    #   redirect_to user_path(user)
    # else
    #   flash[:error] = "Sorry. We couldn't sign you in."
    #   render :new
    # end
    user = User.find_by(email: params[:session][:email])
    
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:notice] = "Sign in successful."
      redirect_to user
    else
      flash.now[:error] = "Sorry. We couldn't sign you in." # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'You are signed out'
    redirect_to listings_path
  end


end
