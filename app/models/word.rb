class Word < ApplicationRecord
  belongs_to :user

  validates :user, :content, presence: true

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
end
