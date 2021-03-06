class FamiliesController < ApplicationController
  # GET /families
  # GET /families.json
  def index
    @families = FamilyDecorator.decorate_collection(Family.all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @families }
    end
  end

  # GET /families/1
  # GET /families/1.json
  def show
    @family = get_family(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @family }
    end
  end

  # GET /families/new
  # GET /families/new.json
  def new
    @family = FamilyDecorator.decorate(Family.new)

    respond_to do |format|
      if @family.save
        @families = FamilyDecorator.decorate_collection(Family.all)
        format.html {redirect_to action: "index"}# new.html.erb
        format.js
      else
        format.html {redirect_to action: "index"}
      end
    end
  end

  # GET /families/1/edit
  def edit
    @family = get_family(params[:id])
  end

  # POST /families
  # POST /families.json
  def create
    puts :family
    @family = FamilyDecorator.decorate(Family.new(params[:family]))

    respond_to do |format|
      if @family.save
        format.html { redirect_to @family, notice: 'Family was successfully created.' }
        format.json { render json: @family, status: :created, location: @family }
      else
        format.html { render action: "new" }
        format.json { render json: @family.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @family = get_family(params[:id])

    respond_to do |format|
      if @family.update(params[:family].permit(:commets, :families, :addresses, :tags, :phoneNumbers, :people, :anniversary, :name))
        format.html { redirect_to @family, notice: 'Family was successfully updated.' }
        format.json { respond_with_bip(@family) }
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@family) }
      end
    end
  end

  # DELETE /families/1
  # DELETE /families/1.json
  def destroy
    @family = Family.find(params[:id])
    @family.destroy

    respond_to do |format|
      format.html { redirect_to families_url }
      format.json { head :no_content }
    end
  end
end
