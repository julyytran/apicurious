require "rails_helper"

RSpec.describe Contribution, type: :model do

  it 'returns followers' do
    VCR.use_cassette 'nokogiri#profile_page' do
      contribution = Contribution.new(user)

      expect(contribution.in_past_year).to eq "765 total"
      expect(contribution.longest_streak).to eq "16 days"
      expect(contribution.current_streak).to eq "3 days"
    end
  end
end
