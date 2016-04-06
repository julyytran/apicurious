class GithubUser < OpenStruct
  def self.service(user)
    GithubService.new(user)
  end
end
