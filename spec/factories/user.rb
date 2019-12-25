FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password_digest {BCrypt::Password.create(Settings.default_password)}
    role {Settings.factories.user.role_fake}
    phone_number {Faker::PhoneNumber.cell_phone}
    after(:build) do |user|
      user.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "default_avatar.png")), filename: "default_avatar.png", content_type: 'image/jpeg')
    end
  end
end
