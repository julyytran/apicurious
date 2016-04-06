require 'rails_helper'

feature "user can login with github" do
  scenario "logging in" do
    stub_omniauth
    visit "/"
    expect(page.status_code).to eq 200

    click_on "Login"

    expect(current_path).to eq root_path
    expect(page).to have_content "julyytran's Account Info"
    expect(page).to have_link "Logout"
    expect(page).to_not have_link "Login"
  end

  scenario "loggin out" do
    stub_omniauth
    visit "/"
    expect(page.status_code).to eq 200

    click_on "Login"

    expect(current_path).to eq root_path
    expect(page).to have_content "julyytran's Account Info"
    expect(page).to have_link "Logout"
    expect(page).to_not have_link "Login"

    click_on "Logout"

    expect(current_path).to eq root_path
    expect(page).to_not have_content "julyytran's Account Info"
    expect(page).to_not have_link "Logout"
    expect(page).to have_link "Login"
  end
end
