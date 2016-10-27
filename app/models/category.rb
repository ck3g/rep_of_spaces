class Category < ApplicationRecord
  belongs_to :user
  has_many :word_categories, dependent: :destroy
  has_many :words, through: :word_categories

  validates :user, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }
end
