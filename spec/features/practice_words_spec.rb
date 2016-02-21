require "rails_helper"

feature "Words practice" do
  given!(:user) { create :user_example_com }

  context "when there is no words to practice" do
    scenario "user see the 'No Words' message" do
      sign_in_as "user@example.com"
      visit words_path
      click_link "Practice"

      expect(page).to have_content "You have no words to practice"
    end
  end

  context "when there is words to practice" do
    scenario "user can see word for practice" do
      create :word, user: user, content: "Wasser"

      sign_in_as "user@example.com"
      visit words_path
      click_link "Practice"

      expect(page).to have_content "Wasser"
      expect(page).to have_selector "a", text: "Hint"
      expect(page).to have_selector "a", text: "Next"
    end
  end
end
