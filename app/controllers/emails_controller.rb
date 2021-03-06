class EmailsController < ApplicationController
  # GET /emails
  # GET /emails.json
  def index
    @emails = Email.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @emails }
    end
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email }
    end
  end

  # GET /emails/new
  # GET /emails/new.json
  def new
    @email = Email.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email }
    end
  end

  # GET /emails/1/edit
  def edit
    @email = Email.find(params[:id])
  end

  # POST /emails
  # POST /emails.json
  def create
    @family = Family.find(params[:family_id])
    @person = Person.find(params[:person_id])
    @email = @person.emails.create(params[:email])

    respond_to do |format|
      if @email.save
        format.html { redirect_to family_path(@family), notice: 'Email was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /emails/1
  # PUT /emails/1.json
  def update
    @email = Email.find(params[:id])
    @family = Family.find(params[:family_id])

    respond_to do |format|
      if @email.update(params[:email].permit(:person))
        format.html { redirect_to family_path(@family), notice: 'Email was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    
    @family = Family.find(params[:family_id])

    respond_to do |format|
      format.html { redirect_to family_path(@family) }
      format.json { head :no_content }
    end
  end
end
