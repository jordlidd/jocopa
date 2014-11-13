class ListingsController < ApplicationController
  before_action :set_user, except: [:showall, :show]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  

  
  def index
    @listings = @user.listings 
  end

  def showall
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = @user.listings.build
  end

  def edit 
  end

  def create
    @listing = @user.listings.build(listing_params)
    @listing.user = current_user

    if @listing.save
      flash[:notice] = 'Your listing has been created and will be reviewed for publishing shortly.'
      redirect_to [@user, @listing]
    else
      flash[:alert] = "Whoops, something went wrong."
      render 'new'
    end
  end

  def update
    if @listing.update(listing_params)
      flash[:notice] = "Listing has been successfully updated!"
      redirect_to [@user, @listing]
    else
      flash[:alert] = "Listing has not been updated."
      render action: 'edit'
    end
  end

  def destroy
    @listing.destroy
    flash[:notice] = "Listing has been deleted."

    redirect_to @user 
  end

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def set_user
      if signed_in? 
        @user = current_user 
      else
        flash[:error] = "You need to log in or sign up before continuing."
        redirect_to signin_url
      end
    end

    def set_user_id
      @listing.user_id = User.find(params[:user_id])
    end

    def set_listing
      @user = User.find(params[:user_id])
      @listing = @user.listings.find(params[:id]) 
    end

    def listing_params
      params.require(:listing).permit(:title, :host, :description, :location, :price, :listing_image)
    end
end
