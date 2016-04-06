class FeedsController < ApplicationController
  def index
    @service = GithubService.new(current_user)
  end
end
