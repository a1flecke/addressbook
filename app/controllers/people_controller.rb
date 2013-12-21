class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  def index
    @people = PersonDecorator.decorate_collection(Person.all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = get_person(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = PersonDecorator.decorate(Person.new)

    respond_to do |format|
      if @person.save
        @people = PersonDecorator.decorate_collection(Person.all)
        format.html {redirect_to action: "index"}# new.html.erb
        format.js
      else
        format.html {redirect_to action: "index"}
      end
    end
  end

  # GET /people/1/edit
  def edit
    @person = get_person(params[:id])
  end

  def update
    @person = get_person(params[:id])
    @family = get_family(params[:person][:family_id]) if params[:person][:family_id]

    params[:person][:family_id] = @family.nil? ? nil : @family.id 
    debugger

    respond_to do |format|
      if       successful = @person.update(params[:person].permit(:family_id, :emails, :phoneNumbers, :tags, :firstName, :lastName, :nickname, :birthday))
        format.html { redirect_to person_path(@person), notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to person_path(@person)}
      format.json { head :no_content }
    end
  end
end
