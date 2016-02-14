require "rails_helper"

feature "Delete the Word" do
  given!(:user) { create :user_example_com }
  given!(:word) { create :word, user: user }

  scenario "user can delete his own word" do
    sign_in_as "user@example.com"
    visit words_path

    within "tr", text: word.content do
      click_link "Delete"
    end

    expect(page).not_to have_content word.content
    expect(Word.count).to eq 0
  end
end
