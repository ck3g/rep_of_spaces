class Word < ApplicationRecord
  belongs_to :user
  has_many :word_categories, dependent: :destroy
  has_many :categories, through: :word_categories

  validates :user, :content, presence: true

  scope :by_category, -> (category) { category.words if category }
  scope :weak, -> {
    where(
      'next_repetition_at < ? OR next_repetition_at IS NULL',
      DateTime.current
    ).order("words.next_repetition_at NULLS FIRST")
  }

  def available_hints
    {
      antonyms: antonyms,
      synonyms: synonyms,
      excerpt: excerpt
    }.reject { |_, v| v.blank? }
  end

  def categories_csv
    categories.pluck(:name).join(", ")
  end
end
