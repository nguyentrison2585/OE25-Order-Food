FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {Settings.default_password}
    password_confirmation {Settings.default_password}
    role {Settings.factories.users.role_fake_boss}
    phone_number {Faker::PhoneNumber.cell_phone}
    after(:build) do |user|
      user.image.attach(io: File.open(Rails.root.
        join("app", "assets", "images", "default_avatar.png")),
        filename: "default_avatar.png")
    end
  end
end
