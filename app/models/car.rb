class Car < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :brand, presence: true, allow_blank: false
  validates :model, presence: true, allow_blank: false
  validates :car_type, presence: true, inclusion: { in: %w(small medium large) }
  validates :fuel_type, presence: true, inclusion: { in: %w(small medium large) }
  validates :car_photo, presence: true, allow_blank: false
  validates :year, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :mileage, presence: true, allow_blank: false, numericality: { only_integer: true }

  # Add scope?
  # validates :price, presence: true, allow_blank: false, numericality: true
  # validates :date_start, presence: true, allow_blank: false # Add scope?
  # validates :date_end, presence: true, allow_blank: false # Add scope?
end
