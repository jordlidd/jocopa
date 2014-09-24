class Listing < ActiveRecord::Base
  validates :description, length: { in: 140..500 }

  belongs_to :user
end
