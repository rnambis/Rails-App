class Library < ActiveRecord::Base
	has_many :rooms
	has_many :reservations
	has_many :users

	validates :name, presence: true, uniqueness: true
end
