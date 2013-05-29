class RootController < ApplicationController
  before_filter :authenticate_user!
  def index
    path = current_user.roles.empty? ? users_inactive_path : people_path

    redirect_to path     
  end

  def inactive
  end
end