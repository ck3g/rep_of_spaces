class Word < ApplicationRecord
  belongs_to :user

  validates :user, :content, presence: true

  scope :weak, -> {
    where('next_repetition_at < ? OR next_repetition_at IS NULL',
          DateTime.current)
  }

  def available_hints
    {
      synonyms: synonyms,
      excerpt: excerpt
    }.reject { |_, v| v.blank? }
  end
end
