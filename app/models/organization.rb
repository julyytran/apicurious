class Organization < OpenStruct
  attr_reader :service

  def self.service(user)
    @service ||= GithubService.new(user)
  end

  def self.all(user)
    service(user).organizations.map {|org| Organization.new(org)}
  end
end
