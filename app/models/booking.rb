class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :driver, class_name: "User"
  has_many :ratings, dependent: :destroy

  validates :purpose, presence: true, allow_blank: false, inclusion: { in: ["Competition", "Showing", "Tourism", "Wedding", "Other Event"]}
  validates :bk_start, presence: true, allow_blank: false
  validates :bk_end, presence: true, allow_blank: false
  validates :bk_price, presence: true, allow_blank: false, numericality: true
  validate :valid_dates

  def valid_dates
    if bk_start <= Date.today
      errors.add(:bk_start, "has to be in the future")
    elsif bk_end <= Date.today
      errors.add(:bk_end, "has to be in the future")
    elsif bk_end <= bk_start
      errors.add("End date must be greater than start date")
    end
  end
end
