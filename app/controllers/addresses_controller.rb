class AddressesController < ApplicationController
  # GET /addresses
  # GET /addresses.json
  def index
    @family = get_family(params[:family_id])
    @addresses = AddressDecorator.decorate_collection(Address.for_family(@family))

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @addresses }
    end
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    @address = get_address(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @address }
    end
  end

  # GET /addresses/new
  # GET /addresses/new.json
  def new
    @address = AddressDecorator.decorate(Address.new)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = get_address(params[:id])
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @family = Family.find(params[:family_id])
    @address = AddressDecorator.decorate(@family.addresses.create(params[:address].permit(:name, :street, :city, :state, :zipCode, :family)))
    respond_to do |format|
      if @address.save
        format.html {redirect_to family_path(@family), notice: 'Address was successfully created.'}
        format.json{ head :no_content}
      else
        format.html { render action: "new"}
        format.json { render json:@address.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    @address = get_address(params[:id])
    @family = Family.find(params[:family_id])
    respond_to do |format|
      if @address.update(params[:address].permit(:name, :street, :city, :state, :zipCode, :family))
        format.html { redirect_to family_path(@family), notice: 'Address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    
    @family = Family.find(params[:family_id])

    respond_to do |format|
      format.html { redirect_to family_path(@family) }
      format.json { head :no_content }
    end
  end
end
