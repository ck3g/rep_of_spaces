require 'rails_helper'

feature "List of categories" do
  given!(:user) { create :user_example_com }
  given!(:word) { create :word, content: "Wasser", user: user }

  context "when user have categories" do
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

  context "when user have no categories" do
    scenario "user sees explanation message instread of table" do
      sign_in_as "user@example.com"

      within "nav.navbar" do
        click_link "Categories"
      end

      within "#categories" do
        expect(page).to have_content "You have no categories yet. You can add them from the create/update word page."
      end
    end
  end
end
