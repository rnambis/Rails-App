class Library < ApplicationRecord
  has_many :rooms
  validates :name, :presence => true
end
