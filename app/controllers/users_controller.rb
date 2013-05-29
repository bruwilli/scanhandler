class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, User, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
     authorize! :show, User, :message => 'Not authorized to show user.'
     @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    authorize! :update, @user, :message => 'Not authorized to edit users.'
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, User, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.roles.delete(user.roles) if !user.roles.nil?
      redirect_to users_path, :notice => "User deactivated."
    else
      redirect_to users_path, :notice => "Can't deactivate yourself."
    end
  end
end