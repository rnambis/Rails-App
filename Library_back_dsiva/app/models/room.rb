class Room < ActiveRecord::Base
	validates :number, presence: true, uniqueness: true
	validates :size, presence: true
	validates :library, presence: true

	belongs_to :library
	has_many :users, through: :reservations
	#enum status: [:available, :reserved]
end
