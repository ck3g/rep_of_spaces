require "rails_helper"

feature "Add new Word" do
  given!(:user) { create :user_example_com }

  scenario "user can add his own words" do
    sign_in_as "user@example.com"
    visit words_path
    click_link "+ Add"

    within "#new_word" do
      select "Neuter", from: "word_gender"
      fill_in "word_content", with: "Wasser"
      fill_in "word_translation", with: "Water"
      fill_in "word_synonyms", with: "Saft"
      fill_in "word_antonyms", with: "Luft"
      fill_in "word_excerpt", with: "Ich trinke Wasser"
      fill_in "word_categories_csv", with: "Essen und Trinken, TOP 100 Words"
      click_button "Add"
    end

    expect(page).to have_content "You have added one more word"
    within "#words" do
      expect(page).to have_content "Wasser"
    end
    expect(Word.count).to eq 1
    expect(Word.last.categories.pluck(:name)).to eq ["Essen und Trinken", "TOP 100 Words"]
  end
end
