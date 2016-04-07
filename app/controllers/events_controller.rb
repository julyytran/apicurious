class EventsController < ApplicationController
  def index
    if params[:type] == "user"
      @pushes = PushEvent.user_pushes(current_user)
    else
      @pushes = PushEvent.following_pushes(current_user)
    end
    render json: @pushes
  end
end
