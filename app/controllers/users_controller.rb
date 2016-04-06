class UsersController < ApplicationController
  def show
    @service = GithubService.new(current_user)
  end
end
