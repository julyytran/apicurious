class UsersController < ApplicationController
  def show
    @contributions = Contribution.new(current_user)
  end
end
