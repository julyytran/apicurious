class UsersController < ApplicationController
  def show
    @service = GithubService.new(current_user)
    @followers = GithubUser.followers(current_user)
    @following = GithubUser.following(current_user)
    @starred = Repository.starred(current_user)
    @repositories = Repository.all(current_user)
    @organizations = Organization.all(current_user)
  end
end
