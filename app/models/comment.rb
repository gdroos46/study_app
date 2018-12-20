class Comment < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :article

  validates :text, presence: true

  enumerize :status, in: [:unapproved, :approved]
end
