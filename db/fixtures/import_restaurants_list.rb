require 'csv'
csv = CSV.read('db/fixtures/development/restaurants_list.csv')
csv.each do |restaurant|
 Restaurant.seed do |s|
  s.id = restaurant[0]
  s.name = restaurant[1] 
  s.address = restaurant[2]
  s.business_hours = restaurant[3]
  s.tel = restaurant[4]
  s.pref = restaurant[5]
  s.latitude = restaurant[6]
  s.longitude = restaurant[7]
 end
end