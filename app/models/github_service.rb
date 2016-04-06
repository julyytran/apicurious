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
  
private

  def get(path)
    JSON.parse(connection.get(path).body)
  end
end
