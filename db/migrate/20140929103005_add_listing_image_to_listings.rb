class AddListingImageToListings < ActiveRecord::Migration
  def change
    add_attachment :listings, :listing_image
  end
end
