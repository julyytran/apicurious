require "rails_helper"

RSpec.describe Organization, type: :model do
  it 'returns organizations' do
    VCR.use_cassette 'github_service#organizations' do
      orgs = Organization.all(user)
      org = orgs.first

      expect(org.login).to eq "ThePivotHJJJ"
      expect(org.class).to eq Organization
    end
  end
end
