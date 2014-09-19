class Listing < ActiveRecord::Base
  validates :descriptions, length: { in: 140..500 }
end
