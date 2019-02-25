class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :driver, class_name: "User"
end
