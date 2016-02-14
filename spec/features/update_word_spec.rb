require 'rails_helper'

feature "Update existing words" do
  given!(:user) { create :user_example_com }
  given!(:word) { create :word, user: user, content: "Waser" }

  scenario "User can update his word" do
    sign_in_as "user@example.com"
    visit words_path

    within "tr", text: "Waser" do
      click_link "Edit"
    end

    within "#edit_word_#{word.id}" do
      fill_in "word_content", with: "Wasser"
      click_button "Update"
    end

    expect(page).to have_content "You have successully updated the word"
    expect(page).to have_content "Wasser"
    expect(page).not_to have_content "Waser"
  end
end
