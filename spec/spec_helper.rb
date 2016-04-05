module SpecHelpers
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: "12345",
      info: {
        name: "July Tran",
        nickname: "julyytran"
            },
      credentials: {
        token: ENV['GITHUB_TEST_TOKEN']
                    },
      extra: {
        raw_info: {
          avatar_url: "https://avatars.githubusercontent.com/u/14022835?v=3"
        }
              }
      })
  end
end

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include SpecHelpers
end
