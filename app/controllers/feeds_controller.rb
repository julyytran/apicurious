class FeedsController < ApplicationController
  def index
    @user_pushes = PushEvent.user_pushes(current_user)
    @following_pushes = PushEvent.following_pushes(current_user)
  end
end
