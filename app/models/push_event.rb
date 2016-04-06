class PushEvent < OpenStruct
  attr_reader :service

  def self.service(user)
    @service ||= GithubService.new(user)
  end

  def self.user_pushes(user)
    service(user).user_push_events.map {|push| PushEvent.new(push)}
  end

  def self.following_pushes(user)
    service(user).following_push_events.map {|push| PushEvent.new(push)}
  end
end
