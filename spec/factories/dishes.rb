FactoryBot.define do
  factory :dish do
    name {Faker::Food.dish}
    description {Faker::Food.description}
    price {Settings.factories.dishes.dish_price_fake}
    after(:build) do |dish|
      dish.image.attach(io: File.open(Rails.root.
        join("app", "assets", "images", "food-1.jpg")),
        filename: "food-1.jpg")
    end
    association :restaurant
  end
end
