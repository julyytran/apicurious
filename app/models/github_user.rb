class GithubUser < OpenStruct
  attr_reader :service

  def self.service(user)
    @service ||= GithubService.new(user)
  end

  def self.following(user)
    service(user).following.map {|github_user| GithubUser.new(github_user)}
  end

  def self.followers(user)
    service(user).followers.map {|github_user| GithubUser.new(github_user)}
  end
end
