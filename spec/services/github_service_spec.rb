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

  it 'returns following' do
    VCR.use_cassette 'github_service#following' do
      following = @service.following
      allan = following.first

      expect(allan["login"]).to eq "amaxwellblair"
    end
  end

  it 'returns repos' do
    VCR.use_cassette 'github_service#repos' do
      repositories = @service.repositories
      repo = repositories.first

      expect(repo["name"]).to eq "rush_hour"
    end
  end

  it 'returns starred repos' do
    VCR.use_cassette 'github_service#starred' do
      repositories = @service.starred
      repo = repositories.first

      expect(repo["name"]).to eq "lesson_plans"
    end
  end

  it 'returns organizations' do
    VCR.use_cassette 'github_service#organizations' do
      orgs = @service.organizations
      org = orgs.first

      expect(org["login"]).to eq "ThePivotHJJJ"
    end
  end

  it 'returns user pushes' do
    VCR.use_cassette 'github_service#user_pushes' do
      pushes = @service.user_push_events
      push = pushes.first

      expect(push["repo"]["name"]).to eq "julyytran/apicurious"
    end
  end

  it 'returns following pushes' do
    VCR.use_cassette 'github_service#following_pushes' do
      pushes = @service.following_push_events
      push = pushes.first

      expect(push["repo"]["name"]).to eq "amaxwellblair/blog"
    end
  end
end
