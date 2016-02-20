require "rails_helper"

feature "Words practice" do
  context "when there is no words to practice" do
    scenario "user see the 'No Words' message" do
      create :user_example_com

      sign_in_as "user@example.com"
      visit words_path
      click_link "Practice"

      expect(page).to have_content "You have no words to practice"
    end
  end
end
