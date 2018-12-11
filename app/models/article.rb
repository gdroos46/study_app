class Article < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true

  mount_uploader :image, ImageUploader
end
