require "rails_helper"

feature "Welcome page" do
  scenario "everybody can see title of the project" do
    visit root_path

    expect(page).to have_content "Rep of Spaces"
  end
end
