class ScansController < ApplicationController
  before_filter :authenticate_user!

  def create
   authorize! :create, current_user, :message => 'Not authorized to create scans.'
   @person = Person.find(params[:person_id])
   @person.scans.create(params[:scan])
   redirect_to @person
  end

  def destroy
   authorize! :destroy, current_user, :message => 'Not authorized to destroy scans.'
   @scan = Scan.find(params[:id])
   @scan.destroy

   redirect_to @scan.person
   end

   def download
   authorize! :download, current_user, :message => 'Not authorized to download scans.'
   @scan = Scan.find(params[:id])
   send_file @scan.image.path, type: 'application/pdf', filename: @scan.image_file_name
   end
end
