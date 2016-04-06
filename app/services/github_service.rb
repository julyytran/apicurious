class GithubService
  attr_reader :connection, :user

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com")
    @connection.headers['Authorization'] = "token #{user.token}"
  end

  def followers
    get("/user/followers")
  end

  def following
    get("/user/following")
  end

  def starred
    get("/user/starred")
  end

  def organizations
    get("/users/#{user.nickname}/orgs")
  end

  def repositories
    get("/user/repos")
  end

  def user_push_events
    all_events = get("/users/#{user.nickname}/events")
    pushes(all_events)
  end

  def following_push_events
    following = get("/user/following")

    all_events = following.map do |follower|
      get("/users/#{follower["login"]}/events")
    end.flatten

    pushes(all_events)
  end

  private

  def get(path)
    JSON.parse(connection.get(path).body)
  end

  def pushes(all_events)
    all_events.select do |event|
      event["type"] == "PushEvent"
    end
  end
end
