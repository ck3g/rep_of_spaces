require "rails_helper"

feature "User registration" do
  scenario "can sign up with valid credentials" do
    visit new_user_registration_path

    within "#new_user" do
      fill_in "user_email", with: "user@example.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "Sign up"
    end

    expect(page).to have_content "You have signed up successfully"
    expect(User.count).to eq 1
  end
end
