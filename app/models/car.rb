class Car < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_many :reviews, through: :bookings
end
