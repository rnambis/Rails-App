class Room < ApplicationRecord
 #belongs_to :library
  validates :ID, :presence => true
  validates :Size, :presence => true
end
