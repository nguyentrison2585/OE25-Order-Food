30.times do |n|
  email = "sonnt#{n+1}@gmail.com"
  user = User.create!(
    email: email,
    password: "password",
    password_confirmation: "password",
    role: 1,
    name: Faker::Name.name,
    confirmed_at: Time.now,
    phone_number: Faker::PhoneNumber.cell_phone)
    user.image.attach(io: File.open(Rails.root
    .join("app", "assets", "images", "default_avatar.png")),
    filename: "default_avatar.png")
end

5.times do |n|
  email = "sonnt#{n+36}@gmail.com"
  user = User.create!(
    email: email,
    password: "password",
    password_confirmation: "password",
    role: 2,
    name: Faker::Name.name,
    confirmed_at: Time.now,
    phone_number: Faker::PhoneNumber.cell_phone)
    user.image.attach(io: File.open(Rails.root
    .join("app", "assets", "images", "default_avatar.png")),
    filename: "default_avatar.png")
end

35.times do |n|
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address,
    open_time: "8:00 - 22:00",
    discount: 15,
    user_id: n%30+1)

  restaurant.image.attach(io: File.open(Rails.root
    .join("app", "assets", "images", "restaurant-#{n%20+1}.jpg")),
    filename: "restaurant-#{n%20+1}.jpg")
end

restaurants = Restaurant.order(:created_at)
Restaurant.all.each do |r|
  5.times do |n|
    dish = r.dishes.create!(
        name: Faker::Food.dish,
        description: "Ngon",
        price: 1000000
      )
    dish.image.attach(io: File.open(Rails.root
      .join("app", "assets", "images", "food-#{n+1}.jpg")),
      filename: "food-#{n+1}.jpg")
  end
end

restaurant = Restaurant.first
dish1 = restaurant.dishes.create!(
  name: "Khoai tây chiên",
  description: "Ngon",
  price: 50000
)
dish1.image.attach(io: File.open(Rails.root
      .join("app", "assets", "images", "food-41.jpg")),
      filename: "food-41.jpg")

dish2 = restaurant.dishes.create!(
  name: "Gà rán",
  description: "Ngon",
  price: 50000
)
dish2.image.attach(io: File.open(Rails.root
      .join("app", "assets", "images", "food-42.jpg")),
      filename: "food-42.jpg")

dish3 = restaurant.dishes.create!(
  name: "Burger Zinger",
  description: "Ngon",
  price: 50000
)
dish3.image.attach(io: File.open(Rails.root
      .join("app", "assets", "images", "food-43.jpg")),
      filename: "food-43.jpg")

dish4 = restaurant.dishes.create!(
  name: "Burger",
  description: "Ngon",
  price: 50000
)
dish4.image.attach(io: File.open(Rails.root
      .join("app", "assets", "images", "food-44.jpg")),
      filename: "food-44.jpg")

dish5 = restaurant.dishes.create!(
  name: "Pepsi lon",
  description: "Ngon",
  price: 50000
)
dish5.image.attach(io: File.open(Rails.root
      .join("app", "assets", "images", "food-45.jpg")),
      filename: "food-45.jpg")
