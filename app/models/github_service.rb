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

  def user_repo_commits
    all_events = get("/users/#{user.nickname}/events")

    all_pushes = pushes(all_events)

    repo_commits(all_pushes)
  end

  def following_repo_commits
    following = get("/user/following")

    all_events = following.map do |follower|
      get("/users/#{follower["login"]}/events")
    end.flatten

    all_pushes = pushes(all_events)

    repo_commits(all_pushes)
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

  def repo_commits(all_pushes)
    all_pushes.map do |push|
      {push["repo"]["name"] => push["payload"]["commits"].map do |commit|
        commit["message"]
      end}
    end
  end
end
