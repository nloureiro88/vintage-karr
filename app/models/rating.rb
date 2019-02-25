class Rating < ApplicationRecord
  belongs_to :booking

  validates :rt_fun, presence: true, allow_blank: false, inclusion: { in: (1..5).to_a, message: "Rating must be between 1 and 5." }
  validates :rt_condition, presence: true, allow_blank: false, inclusion: { in: (1..5).to_a, message: "Rating must be between 1 and 5." }
  validates :rt_performance, presence: true, allow_blank: false, inclusion: { in: (1..5).to_a, message: "Rating must be between 1 and 5." }
  validates :rt_owner, presence: true, allow_blank: false, inclusion: { in: (1..5).to_a, message: "Rating must be between 1 and 5." }
end
