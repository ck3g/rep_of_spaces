require 'rails_helper'

feature "Sign in" do
  scenario "can sign in with valid credentials" do
    create :user, email: "user@example.com", password: "password"

    sign_in_as "user@example.com", "password"

    expect(page).to have_content "Signed in successfully"
  end
end
