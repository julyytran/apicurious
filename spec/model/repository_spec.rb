require "rails_helper"

RSpec.describe Repository, type: :model do
  it 'returns repos' do
    VCR.use_cassette 'github_service#repos' do
      repositories = Repository.all(user)
      repo = repositories.first

      expect(repo.name).to eq "rush_hour"
      expect(repo.class).to eq Repository
    end
  end

  it 'returns starred repos' do
    VCR.use_cassette 'github_service#starred' do
      repositories = Repository.starred(user)
      repo = repositories.first

      expect(repo.name).to eq "lesson_plans"
      expect(repo.class).to eq Repository
    end
  end
end
