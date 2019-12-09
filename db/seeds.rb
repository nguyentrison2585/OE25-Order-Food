5.times do |n|
  email = "sonnt#{n+1}@gmail.com"
  User.create!(
    email: email,
    password: "password",
    password_confirmation: "password",
    role: 2,
    name: "Nguyễn Trí Sơn",
    phone_number: "0123456789")
end

15.times do |n|
  restaurant = Restaurant.create!(
    name: "Pizza Mập - Pizza Online #{n+1}",
    phone_number: "0123456789",
    address: "150 Lạc Nghiệp, Quận Hai Bà Trưng, Hà Nội",
    open_time: "8:00 - 22:00",
    discount: 15,
    user_id: rand(5)+1)

  restaurant.image.attach(io: File.open(Rails.root
    .join("app", "assets", "images", "restaurant-#{n+1}.jpg")),
    filename: "restaurant-#{n+1}.jpg")
end

restaurants = Restaurant.order(:created_at)
Restaurant.all.each do |r|
  5.times do |n|
    dish = r.dishes.create!(
        name: "Pizza bò hầm đặc biệt #{n+1}",
        description: "Ngon",
        price: 1000000
      )
    dish.image.attach(io: File.open(Rails.root
      .join("app", "assets", "images", "food-#{n+1}.jpg")),
      filename: "food-#{n+1}.jpg")
  end
end

5.times do |n|
  name = Faker::Name.name
  description = "combo is ready"
  Restaurant.find(1).combos.create!(name: name,
                                    description: description)
end
