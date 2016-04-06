require "rails_helper"

feature "user can view account info" do
  scenario "they see their account info" do
    pending
    stub_omniauth
    visit "/"
    expect(page.status_code).to eq 200

    click_on "Login"
    click_on "julyytran's Account Info"

    VCR.use_cassette 'github_service#followers' do
      expect(page).to have_content "Followers: 12"
    end

  end
end
