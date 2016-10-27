class WordCategory < ApplicationRecord
  belongs_to :word
  belongs_to :category

  validates :word, :category, presence: true
end
