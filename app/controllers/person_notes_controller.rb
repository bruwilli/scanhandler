class PersonNotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    authorize! :create, PersonNote, :message => 'Not authorized to create person notes.'
    @person = Person.find(params[:person_id])
    @person_note = @person.person_notes.build(params[:person_note])

    @person_note.user_id = current_user.id if @person_note
    if @person_note.save
      UserMailer.send_person_note_notification_email(@person, current_user, @person_note).deliver
      flash[:notice] = 'Note was successfully saved'
      redirect_to(@person)
    else
      flash.now[:alert] = 'Error saving note.  See errors below.'
      @person.person_notes.delete_at(-1)
      @first_name = @person.first_name
      @last_name = @person.last_name
      render 'people/show'
    end
  end

  def destroy
   authorize! :destroy, PersonNote, :message => 'Not authorized to destroy notes.'
   @person_note = Scan.find(params[:id])
   @person_note.destroy

   flash[:notice] = 'Note was successfully deleted'
   redirect_to @person_note.person
   end
end
