class User < ApplicationRecord
  validates :name, presence: true
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
