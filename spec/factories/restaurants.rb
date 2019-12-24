FactoryBot.define do
  factory :restaurant do
    name {Faker::Restaurant.name}
    address {Faker::Address.full_address}
    phone_number {Faker::PhoneNumber.cell_phone}
    open_time {Settings.factories.restaurants.open_time_fake}
    discount {Settings.factories.restaurants.discount_fake}
    after(:build) do |restaurant|
      restaurant.image.attach(io: File.open(Rails.root.
        join("app", "assets", "images", "restaurant-1.jpg")),
        filename: "restaurant-1.jpg")
    end
    association :user
  end
end
