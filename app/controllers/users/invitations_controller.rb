class Users::InvitationsController < Devise::InvitationsController
  before_filter :authenticate_user!

  def create
    authorize! :create, User, :message => 'Not authorized to invite new users'
    @role = Role.find(resource_params[:role_id])
    self.resource = User.invite!({ email: resource_params[:email] }, current_inviter) if not @role.nil?

    if resource.errors.empty? and 
       !@role.nil? and
       !self.resource.add_role(@role.name).nil?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      respond_with resource, :location => after_invite_path_for(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end

  def new
    authorize! :create, User, :message => 'Not authorized to invite new users'
    super
  end

  def destroy
    authorize! :destroy, User, :message => 'Not authorized to destroy new users'
    super
  end
end