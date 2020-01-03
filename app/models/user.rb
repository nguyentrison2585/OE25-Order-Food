class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :restaurants, dependent: :destroy
  has_one_attached :image

  before_save{email.downcase!}
  VALID_EMAIL_REGEX = Settings.valid_email_regex

  validates :name, presence: true, length: {maximum: Settings.max_name}
  validates :email, presence: true, length: {maximum: Settings.max_email},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true
  validates :password, presence: true, length: {minimum: Settings.min_password},
                       allow_nil: true
  validates :phone_number, presence: true

  USER_PARAMS = %i(name email phone_number current_password password
    password_confirmation).freeze

  enum role: {admin: 0, boss: 1, normal: 2}
end
