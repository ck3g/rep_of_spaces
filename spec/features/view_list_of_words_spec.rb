require "rails_helper"

feature "View list of the Words" do
  scenario "user can see list of his words" do
    create :user_example_com

    sign_in_as "user@example.com"
    visit words_path

    within "#words" do
      expect(page).to have_content "Wasser"
    end
  end
end
