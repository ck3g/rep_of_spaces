require 'rails_helper'

feature "List of categories" do
  given!(:user) { create :user_example_com }
  given!(:word) { create :word, content: "Wasser", user: user }
  given!(:category) { create :category, name: "Getränke", user: user }

  background do
    word.categories << category
  end

  scenario "can see list of categories" do
    sign_in_as "user@example.com"

    within "nav.navbar" do
      click_link "Categories"
    end

    within "#categories" do
      expect(page).to have_selector "tr", text: "Getränke (1 Word)"
    end
  end
end
