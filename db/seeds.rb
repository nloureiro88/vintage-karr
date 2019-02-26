# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'
require 'csv'

User.destroy_all
Car.destroy_all
Booking.destroy_all
Rating.destroy_all

filepath_users = './db/users.csv'
filepath_cars = './db/cars.csv'

# Get car images from rotten tomatoes

html_file = open("https://editorial.rottentomatoes.com/article/Total-Recall-50-Most-Memorable-Movie-Cars/").read
html_doc = Nokogiri::HTML(html_file)

car_images = []
html_doc.search('table tr td p>img').each do |element|
  car_images << element.attributes["src"].value
end

# Create users

csv_options = { col_sep: ';' }
CSV.foreach(filepath_users, csv_options) do |row|
  User.create!(name: row[0],
               email: row[0].downcase.tr(" ", ".") + "@lewagon.com",
               password: "12345678",
               address: row[1],
               photo: row[2])
end

# Get car images

html_file = open("https://editorial.rottentomatoes.com/article/Total-Recall-50-Most-Memorable-Movie-Cars/").read
html_doc = Nokogiri::HTML(html_file)

car_images = []
html_doc.search('table tr td p>img').each do |element|
  car_images << element.attributes["src"].value
end

# Create cars

CAR_TYPES = ["Convertible", "Coupe", "Hatchback", "Luxury", "SUV", "Sedan", "Sports", "Truck", "Van", "Wagon"]
FUEL_TYPES = ["Bio-diesel", "Diesel", "Ethanol", "Gasoline", "Natural Gas", "Propane"]
PURPOSES = ["Competition", "Showing", "Tourism", "Wedding", "Other Event"]

i = 0
csv_options = { col_sep: ';' }
CSV.foreach(filepath_cars, csv_options) do |row|
  Car.create!(owner: User.find(1 + i/5.floor), # 5 cars for each of the first 10 users
              brand: row[0],
              model: row[1],
              year: row[2].to_i,
              description: row[3],
              car_photo: car_images[i],
              car_type: CAR_TYPES[rand(0..(CAR_TYPES.length - 1))],
              fuel_type: FUEL_TYPES[rand(0..(FUEL_TYPES.length - 1))],
              mileage: rand(50_000..400_000),
              price: rand(90..900),
              date_start: Date.new(2018,1,1), # to be changed for bookings
              date_end: Date.new(2020,12,31)) # to be changed for bookings
  i += 1
end

# Create random bookings

User.all.each do |driver_user|
  3.times do
    Booking.create!(car: Car.find(rand(1..Car.count)), #random car
                   driver: driver_user,
                   purpose: PURPOSES[rand(0..PURPOSES.length - 1)],
                   status: "created", # to be changed for bookings
                   bk_start: Date.new(2019,2,24), # to be changed for bookings
                   bk_end: Date.new(2019,3,15)) # to be changed for bookings
  end
end

# Add 1 rating per booking
# to be changed for ratings

Booking.all.each do |bk|
  Rating.create!(booking: bk,
                 rt_fun: rand(1..5),
                 rt_condition: rand(1..5),
                 rt_performance: rand(1..5),
                 rt_owner: rand(1..5))
end
