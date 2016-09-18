class User < ApplicationRecord
  has_and_belongs_to_many :libraries
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirm, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
