class GithubService
  attr_reader :connection, :user

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com")
    @connection.headers['Authorization'] = "token #{user.token}"
  end

  def followers
    get("/users/#{user.nickname}/followers")
  end

private

  def get(path)
    JSON.parse(connection.get(path).body)
  end
end
