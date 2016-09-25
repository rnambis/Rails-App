class Reservation < ActiveRecord::Base
  #belongs_to :room
  belongs_to :library#, through: :room
  belongs_to :user
  belongs_to :room

  SIZE = ['Small', 'Medium', 'Large']
  LIBRARY = ['Hunt Library', 'Hill Library']
  validates :size, presence: true
  validates :library, presence: true
  validates :date, :inclusion => {:within => Date.today...(Date.today + 7.days).end_of_day}
 # :inclusion => { :in => Time.now..(Time.now + 6.months) }

  validates :time, presence: true

end
