FactoryGirl.define do
  factory :word do
    user
    content "My Word"
    translation "My Word translation"
    excerpt "Excerpt of the word"
  end
end
