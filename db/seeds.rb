User.delete_all
Restaurant.delete_all
Combo.delete_all
ComboDetail.delete_all
Dish.delete_all
#user
10.times do |n|
  name = Faker::Name.name
  email = "example@-#{n+1}railstutorial.org"
  password = "password"
  phone_number = "0329984400"
  role = 2
  User.create!(id: n + 1,
               name: name,
               email: email,
               password: password,
               role: role,
               phone_number: phone_number,)
end


#restaurant
5.times do |n|
  name = Faker::Name.name
  phone_number = "0329984-#{n+1}00"
  address = "Ha Noi"
  open_time = "8.00am - 9.00pm"
  Restaurant.create!(id: n + 1,
               name: name,
               phone_number: phone_number,
               address: address,
               open_time: open_time,
               user_id: n + 1)
end


5. times do |n|
  name = Faker::Name.name
  description = "that is all my delicious dish"
  price = "200000"
  Restaurant.find(1).dishes.create!(id: n + 1,
                                    name: name,
                                    description: description,
                                    price: price)
end


5.times do |n|
  name = Faker::Name.name
  description = "combo is ready"
  Restaurant.find(1).combos.create!(name: name,
                                    description: description,)
end

3.times do |n|
  Restaurant.find(1).combos[0].combo_details.create(dish_id: n + 3)
end
