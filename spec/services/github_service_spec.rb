require "rails_helper"

describe GithubService do

  before(:each) do
    @service = GithubService.new(user)
  end

  it 'returns followers' do
    VCR.use_cassette 'github_service#followers' do
      followers = @service.followers
      follower = followers.first

      expect(follower["login"]).to eq "MDes41"
    end
  end
end
