require "rails_helper"

feature "user can view commit feed" do
  scenario "they see their commit feed info" do
    stub_omniauth
    visit "/"
    expect(page.status_code).to eq 200

    click_on "Login"

    VCR.use_cassette 'github_service#user_pushes' do
      VCR.use_cassette 'github_service#following_pushes' do
        click_on "Feed"

        expect(current_path).to eq feeds_path
        expect(page).to have_content "julyytran/apicurious"
        expect(page).to have_content "amaxwellblair/blog"
      end
    end
  end
end
