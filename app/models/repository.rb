class Repository < OpenStruct
  attr_reader :service

  def self.service(user)
    @service ||= GithubService.new(user)
  end

  def self.starred(user)
    service(user).starred.map {|repo| Repository.new(repo)}
  end

  def self.all(user)
    service(user).repositories.map {|repo| Repository.new(repo)}
  end
end
