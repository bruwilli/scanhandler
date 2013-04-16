class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, current_user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
     @user = User.find(params[:id])
     authorize! :show, @user, :message => 'Not authorized to show user.'
  end
  
  def update
    @user = User.find(params[:id])
    authorize! :update, current_user, :message => 'Not authorized as an administrator.'
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, current_user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end