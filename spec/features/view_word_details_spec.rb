require 'rails_helper'

feature "View Word details" do
  given!(:user) { create :user_example_com }
  given!(:word) { create :word, user: user }
  scenario "user can see word details" do
    sign_in_as "user@example.com"

    visit words_path
    within "tr", text: word.content do
      click_link word.content
    end

    expect(page).to have_content word.content
    expect(page).to have_content word.translation
    expect(page).to have_content word.excerpt
  end
end
