class Article < ApplicationRecord
  extend Enumerize

  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true

  mount_uploader :image, ImageUploader

  enumerize :status, in: [:draft, :publish]

  scope :article_publish, -> { where(status: "publish") }
  scope :article_draft, -> { where(status: "draft") }
end
