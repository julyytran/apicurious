require "rails_helper"

RSpec.describe PushEvent, type: :model do
  it 'returns user pushes' do
    VCR.use_cassette 'github_service#user_pushes' do
      pushes = PushEvent.user_pushes(user)
      push = pushes.first

      expect(push.repo["name"]).to eq "julyytran/apicurious"
      expect(push.class).to eq PushEvent
    end
  end

  it 'returns following pushes' do
    VCR.use_cassette 'github_service#following_pushes' do
      pushes = PushEvent.following_pushes(user)
      push = pushes.first

      expect(push.repo["name"]).to eq "amaxwellblair/blog"
      expect(push.class).to eq PushEvent
    end
  end
end
