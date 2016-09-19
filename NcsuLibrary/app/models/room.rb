class Room < ApplicationRecord
  belongs_to :library
  validates :number, :presence => true
  validates :size, :presence => true
  validates :name, :presence => true
end
