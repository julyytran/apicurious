class UsersController < ApplicationController
  def show
    @followers = GithubUser.followers(current_user)
    @following = GithubUser.following(current_user)
    @starred = Repository.starred(current_user)
    @repositories = Repository.all(current_user)
    @organizations = Organization.all(current_user)
    @contributions = Contribution.new(current_user)
  end
end
