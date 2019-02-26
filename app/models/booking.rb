class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :driver, class_name: "User"
  has_many :ratings, dependent: :destroy

  validates :purpose, presence: true, allow_blank: false
  validates :bk_start, presence: true, allow_blank: false
  validates :bk_end, presence: true, allow_blank: false
end
