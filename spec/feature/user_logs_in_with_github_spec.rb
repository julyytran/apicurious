require 'rails_helper'

class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = Apicurious::Application
  end

  feature "user can login with github" do
    scenario "logging in" do
      stub_omniauth
      visit "/"
      expect(page.status_code).to eq 200

      click_on "Login"

      expect(current_path).to eq root_path
      expect(page).to have_content "July Tran"
      expect(page).to have_link "Logout"
      expect(page).to_not have_link "Login"
    end
  end
end
