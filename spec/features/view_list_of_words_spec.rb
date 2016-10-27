require "rails_helper"

feature "View list of the Words" do
  given!(:user) { create :user_example_com }


  background do
    juice = create :word, user: user, content: "Saft"
    water = create :word, user: user, content: "Wasser"
    cheese = create :word, user: user, content: "Käse"
    bread = create :word, content: "Brot"


    drinks = create :category, name: "Getränke", user: user
    drinks.words = [juice, water]
  end

  scenario "user can see list of all his words" do
    sign_in_as "user@example.com"
    within "nav.navbar" do
      click_link "Words"
    end

    within "#words" do
      expect(page).to have_content "3 Words"
      expect(page).to have_content "Saft"
      expect(page).to have_content "Wasser"
      expect(page).to have_content "Käse"
      expect(page).not_to have_content "Brot"
    end
  end

  scenario "user can see list of his words filtered by category" do
    sign_in_as "user@example.com"
    within "nav.navbar" do
      click_link "Categories"
    end

    within "#categories" do
      click_link "Getränke"
    end

    within "#words" do
      expect(page).to have_content "2 Words"
      expect(page).to have_content "Saft"
      expect(page).to have_content "Wasser"
      expect(page).not_to have_content "Käse"
      expect(page).not_to have_content "Brot"
    end
  end
end
