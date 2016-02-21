FactoryGirl.define do
  factory :word do
    user
    content "My Word"
    translation "My Word translation"
    excerpt "Excerpt of the word"

    trait :strong do
      next_repetition_at 1.minute.from_now
    end

    trait :weak do
      next_repetition_at 1.minute.ago
    end
  end
end
