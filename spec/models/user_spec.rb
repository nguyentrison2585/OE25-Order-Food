require "rails_helper"

RSpec.describe User, type: :model do
  subject {FactoryBot.build :user}
  
  describe "Valid User" do
    it { expect(subject).to be_valid}
    it { expect(subject.image).to be_attached}
  end

  describe "Associations" do
    it { is_expected.to have_many(:comments).dependent(:destroy)}
    it { is_expected.to have_many(:rates).dependent(:destroy)}
    it { is_expected.to have_many(:orders).dependent(:destroy)}
    it { is_expected.to have_many(:restaurants).dependent(:destroy)}
  end

  describe "enum" do
    it { is_expected.to define_enum_for(:role).with_values([:admin, :boss, :normal])}
  end
  
  describe "has secure password" do
    it { is_expected.to have_secure_password }
  end
  
  describe "Validations" do
    it { is_expected.to validate_presence_of(:name).with_message(I18n.t("errors_blank")) }
    it { is_expected.to validate_presence_of(:email).with_message(I18n.t("errors_blank")) }
    it { is_expected.to validate_uniqueness_of(:email).with_message(I18n.t("errors_taken")) }
    it { is_expected.not_to allow_value("qwe@gmail").for(:email).with_message(I18n.t("invalid_errors")) }
    it { is_expected.to validate_presence_of(:password).with_message(I18n.t("errors_blank")) }
    it { is_expected.to validate_presence_of(:phone_number).with_message(I18n.t("errors_blank")) }
  end
end
