class Listing < ActiveRecord::Base
  validates :description, length: { in: 50..500 }

  belongs_to :user
end
