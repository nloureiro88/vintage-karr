class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :driver, class_name: "User"
  has_many :ratings, dependent: :destroy

  validates :purpose, inclusion: { in: ["Competition", "Showing", "Tourism", "Wedding", "Other Event"]}
  validates :bk_start, presence: true, allow_blank: false
  validates :bk_end, presence: true, allow_blank: false
  validates :bk_price, presence: true, allow_blank: false, numericality: true
  # validate :valid_dates

  def valid_dates
    return unless bk_start && bk_end

    if bk_start < Date.today
      errors.add("Start date has to be in the future")
    elsif bk_end < Date.today
      errors.add("End date has to be in the future")
    elsif bk_end <= bk_start
      errors.add("End date must be greater than start date")
    end
  end
end
