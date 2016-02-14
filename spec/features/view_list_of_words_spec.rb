require "rails_helper"

feature "View list of the Words" do
  scenario "user can see list of his words" do
    user = create :user_example_com

    create :word, user: user, content: "Wasser"
    create :word, user: user, content: "Käse"
    create :word, content: "Brot"

    sign_in_as "user@example.com"
    within "nav.navbar" do
      click_link "Words"
    end

    within "#words" do
      expect(page).to have_content "2 Words"
      expect(page).to have_content "Wasser"
      expect(page).to have_content "Käse"
      expect(page).not_to have_content "Brot"
    end
  end
end
