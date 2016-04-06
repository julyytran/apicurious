require "rails_helper"

feature "user can view account info" do
  scenario "they see their account info" do
    stub_omniauth
    visit "/"
    expect(page.status_code).to eq 200

    click_on "Login"

    VCR.use_cassette 'github_service#followers' do
      VCR.use_cassette 'github_service#following' do
        VCR.use_cassette 'github_service#repos' do
          VCR.use_cassette 'github_service#starred' do
            VCR.use_cassette 'github_service#organizations' do
              VCR.use_cassette 'github_service#user_pushes' do
                VCR.use_cassette 'github_service#following_pushes' do

                  click_on "julyytran's Account Info"
                  expect(page).to have_content "julyytran's Info"
                  expect(page).to have_content "Followers: 12"
                  expect(page).to have_content "Following: 1"
                  expect(page).to have_content "Starred Repos: 1"
                  expect(page).to have_content "Organizations: 1"
                  expect(page).to have_content "My Repositories: 30"
                end
              end
            end
          end
        end
      end
    end
  end
end
