class PhoneNumbersController < ApplicationController
  # GET /phone_numbers
  # GET /phone_numbers.json
  def index
    if params.has_key?(:family_id)
      @parent = get_family(params[:family_id])
      @phone_numbers = PhoneNumber.for_family(@parent)
      @new_path = new_family_phone_number_path(@parent)
    else
      @parent = get_person(params[:person_id])
      @phone_numbers = PhoneNumber.for_person(@parent)
      @new_path = new_family_phone_number_path(@parent)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phone_numbers }
    end
  end

  # GET /phone_numbers/1
  # GET /phone_numbers/1.json
  def show
    @phone_number = PhoneNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phone_number }
    end
  end

  # GET /phone_numbers/new
  # GET /phone_numbers/new.json
  def new
    @phone_number = PhoneNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phone_number }
    end
  end

  # GET /phone_numbers/1/edit
  def edit
    @phone_number = PhoneNumber.find(params[:id])
  end

  # POST /phone_numbers
  # POST /phone_numbers.json
  def create
    if params.has_key?(:person_id)
      person = Person.find(params[:person_id])
      phone_number = person.phoneNumbers.create(params[:phone_number].permit(:name, :value))
      path = person_path(person)
    else
      family = Family.find(params[:family_id])
      phone_number = family.phoneNumbers.create(params[:phone_number].permit(:name, :value))
      path = family_path(family)
    end
    
    respond_to do |format|
      if phone_number.save
        format.html { redirect_to path, notice: 'Phone number was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: phone_number.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @phone_number = PhoneNumber.find(params[:id])
    @family = Family.find(params[:family_id])

    respond_to do |format|
      if @phone_number.update(params[:phone_number].permit(:person, :family, :name, :value))
        format.html { redirect_to family_path(@family), notice: 'Phone number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_numbers/1
  # DELETE /phone_numbers/1.json
  def destroy
    @phone_number = PhoneNumber.find(params[:id])
    @phone_number.destroy
    
    @family = Family.find(params[:family_id])

    respond_to do |format|
      format.html { redirect_to family_path(@family) }
      format.json { head :no_content }
    end
  end
end
