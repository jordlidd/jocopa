class ListingsController < ApplicationController
  before_action :set_user, except: :showall
  # before_action :require_signin!, except: [:show, :showall]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  

  
  def index
    @listings = @user.listings 
  end

  def showall
    @listings = Listing.all
  end

  def show
  end

  # GET /listings/new
  def new
    @listing = @user.listings.build
  end

  # GET /listings/1/edit
  def edit
    
  end

  # POST /listings
  # POST /listings.json
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

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    flash[:notice] = "Listing has been deleted."

    redirect_to @user 
  end

  private

    # def require_signin!
    #   if current_user.nil?
    #     flash[:error] = "You need to log in or sign up before continuing."
    #     redirect_to signin_url
    #   end
    # end

    # def current_user
    #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end
    # helper_method :current_user

    def set_user
      if signed_in? 
        @user = current_user 
      else
        flash[:error] = "You need to log in or sign up before continuing."
        redirect_to signin_url
      end
    end
    # rescue ActiveRecord::RecordNotFound
    #   flash[:alert] = "The user you were looking for could not be found."
    #   redirect_to root_path
    # end
  
    def set_listing
      @listing = @user.listings.find(params[:id]) 
    end

    def listing_params
      params.require(:listing).permit(:title, :host, :description, :location, :price, :listing_image)
    end
end
