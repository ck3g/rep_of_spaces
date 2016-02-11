require 'rails_helper'

feature "Sign in" do
  scenario "can sign in with valid credentials" do
    create :user, email: "user@example.com", password: "password"

    visit new_user_session_path

    within "#new_user" do
      fill_in "user_email", with: "user@example.com"
      fill_in "user_password", with: "password"
      click_button "Log in"
    end

    expect(page).to have_content "Signed in successfully"
  end
end
