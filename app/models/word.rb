class Word < ApplicationRecord
  belongs_to :user

  validates :user, :content, presence: true
end
