class Car < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_many :ratings, through: :bookings

  validates :brand, presence: true, allow_blank: false
  validates :model, presence: true, allow_blank: false
  validates :car_type, presence: true, inclusion: { in: ["Convertible", "Coupe", "Hatchback", "Luxury", "SUV", "Sedan", "Sports", "Truck", "Van", "Wagon"] }
  validates :fuel_type, presence: true, inclusion: { in: ["Bio-diesel", "Diesel", "Ethanol", "Gasoline", "Natural Gas", "Propane"] }
  validates :car_photo, presence: true, allow_blank: false
  validates :year, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :mileage, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :price, presence: true, allow_blank: false, numericality: true

  include PgSearch
  pg_search_scope :search_by_all,
                  against: [:brand, :model],
                  using: {
                    tsearch: { prefix: true }
                  }

  pg_search_scope :global_search,
                  against: [:brand, :model],
                  associated_against: {
                    owner: [:address, :name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
