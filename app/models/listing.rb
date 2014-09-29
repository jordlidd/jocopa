class Listing < ActiveRecord::Base
  validates :description, length: { in: 50..500 }
  belongs_to :user

   # Validate the attached image is image/jpg, image/png, etc and is less than 5MB
  validates_attachment_content_type :listing_image, 
    :content_type => /\Aimage\/.*\Z/,
    :attachment_size => less_than: 5.megabytes

  # This method associates the attribute ":listing_image" with a file attachment
  has_attached_file :listing_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

 
end
