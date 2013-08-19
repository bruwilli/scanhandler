class ScansController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json, :xml

  def create
    authorize! :create, Scan, :message => 'Not authorized to create scans.'
    @person = Person.find(params[:person_id])
    @scan = @person.scans.build(params[:scan])

    @scan.user_id = current_user.id if @scan
    if @scan.save
      UserMailer.send_scan_notification_email(@person, current_user, @scan).deliver
      flash[:notice] = 'Scan was successfully saved'
      redirect_to(@person)
    else
      flash.now[:alert] = 'Error saving scan image.  See errors below.'
      @person.scans.delete_at(-1)
      @first_name = @person.first_name
      @last_name = @person.last_name
      render 'people/show'
    end
  end

  def destroy
   authorize! :destroy, Scan, :message => 'Not authorized to destroy scans.'
   @scan = Scan.find(params[:id])
   @scan.destroy

   flash[:notice] = 'Scan was successfully deleted'
   redirect_to @scan.person
   end

   def download
   authorize! :download, Scan, :message => 'Not authorized to download scans.'
   @scan = Scan.find(params[:id])
   send_file @scan.image.path(:pdf), type: 'application/pdf', filename: @scan.image_file_name
   end
end
