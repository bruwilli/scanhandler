class PeopleController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :read, current_user, :message => 'Not authorized to view person information.'
  end

  def search
    authorize! :read, current_user, :message => 'Not authorized to view person information.'
    first_name = params[:first_name].strip
    last_name = params[:last_name].strip
    @people = Person.search(first_name.empty? ? nil : first_name, 
                            last_name.empty? ? nil : last_name,
                            params[:fuzzy],
                            params[:nicknames])
    render partial: 'people/search'
  end

  def new
    authorize! :create, current_user, :message => 'Not authorized to create person information.'
    @person = Person.new
  end

  def create
    authorize! :create, current_user, :message => 'Not authorized to create person information.'
    @person = Person.new(params[:person])
    @person.user_id = current_user.id
    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end

  def show
   authorize! :read, current_user, :message => 'Not authorized to view person information.'
   @person = Person.find(params[:id])
   @scan = Scan.new
  end
  
  def update
    authorize! :update, current_user, :message => 'Not authorized to modify person information.'
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person], :as => :vip)
      redirect_to people_path, :notice => "Update successful"
    else
      redirect_to people_path, :alert => "Unable to update person information."
    end
  end
    
  def destroy
    authorize! :destroy, current_user, :message => 'Not authorized to delete person information.'
    person = Person.find(params[:id])
    person.destroy
    redirect_to users_path, :notice => "Person deleted."
  end
end
