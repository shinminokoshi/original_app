require 'csv'
csv = CSV.read('db/fixtures/development/restaurants_list.csv')
csv.each do |restaurant|
 Restaurant.seed do |s|
  s.name = restaurant[0] 
  s.address = restaurant[1]
  s.business_hours = restaurant[2]
  s.tel = restaurant[3]
  s.pref = restaurant[4]
  s.latitude = restaurant[5]
  s.longitude = restaurant[6]
  s.shop_image1 = restaurant[7]
 end
end