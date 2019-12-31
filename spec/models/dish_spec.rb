require "rails_helper"

RSpec.describe Dish, type: :model do
  let!(:user){FactoryBot.create :user}
  let!(:restaurant){FactoryBot.create :restaurant, user_id: user.id}
  subject {FactoryBot.build :dish, restaurant_id: restaurant.id}

  describe "Create success" do
    it {expect(subject).to be_valid}
    it {expect(subject.image).to be_attached}
  end

  describe "Associations" do
    it {expect(subject).to belong_to :restaurant}
  end

  describe "Validations" do
    it {expect(subject).to validate_presence_of(:name).
      with_message(I18n.t("blank_error"))}
    it {expect(subject).to validate_presence_of(:description).
      with_message(I18n.t("blank_error"))}
    it {expect(subject).to validate_presence_of(:price).
      with_message(I18n.t("blank_error"))}

    context "Name invalid" do
      before {subject.name = nil}
      it {expect(subject).not_to be_valid}
    end

    context "Description invalid" do
      before {subject.description = nil}
      it {expect(subject).not_to be_valid}
    end

    context "Price invalid" do
      before {subject.price = nil}
      it {expect(subject).not_to be_valid}
    end
  end
end
