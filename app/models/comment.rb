class Comment < ApplicationRecord
  to_belongs :user
  to_belongs :article

  validates :text, presence: true
end
