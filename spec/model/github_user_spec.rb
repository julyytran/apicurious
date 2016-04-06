require "rails_helper"

RSpec.describe GithubUser, type: :model do
  it 'returns followers' do
    VCR.use_cassette 'github_service#followers' do
      followers = GithubUser.followers(user)
      follower = followers.first

      expect(follower.login).to eq "MDes41"
      expect(follower.class).to eq GithubUser
    end
  end

  it 'returns following' do
    VCR.use_cassette 'github_service#following' do
      following = GithubUser.following(user)
      allan = following.first

      expect(allan.login).to eq "amaxwellblair"
      expect(allan.class).to eq GithubUser
    end
  end
end
