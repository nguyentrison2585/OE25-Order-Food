require "rails_helper"

RSpec.describe Restaurant, type: :model do
  let(:user){FactoryBot.create :user}
  subject {FactoryBot.build :restaurant, user_id: user.id}

  describe "Valid restaurant" do
    it {expect(subject).to be_valid}
    it {expect(subject.image).to be_attached}
  end

  describe "Associations" do
    it {expect(subject).to belong_to :user}
  end

  describe "Validations" do
    it {expect(subject).to validate_presence_of(:name).
      with_message(I18n.t("blank_error"))}
    it {expect(subject).to validate_presence_of(:address).
      with_message(I18n.t("blank_error"))}
    it {expect(subject).to validate_presence_of(:open_time).
      with_message(I18n.t("blank_error"))}
    it {expect(subject).to validate_presence_of(:phone_number).
      with_message(I18n.t("blank_error"))}
  end

  describe "Scopes" do
    let(:user){FactoryBot.create :user}
    let!(:r1){FactoryBot.create :restaurant, name: "Piza Mập", user_id: user.id}
    let!(:r2){FactoryBot.create :restaurant, name: "Piza Còi", user_id: user.id}

    context "Search" do
      it {expect(Restaurant.search("Piza")).to eq [r1, r2]}
      it {expect(Restaurant.search("Mập")).to eq [r1]}
      it {expect(Restaurant.search("Còi")).to eq [r2]}
      it {expect(Restaurant.search("Béo")).to eq []}
    end
  end
end
