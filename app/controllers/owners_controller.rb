class OwnersController < ApplicationController
  before_action :set_owner, only: %i[ show edit update destroy ]

  # GET /owners or /owners.json
  def index
    @owners = Owner.all
  end

  # GET /owners/1 or /owners/1.json
  def show
    @owner = Owner.includes(:vehicles, :properties).find(params[:id])
    @vehicles = @owner.vehicles
    @properties = @owner.properties
  end
 

  # GET /owners/new
 # vehicles_controller.rb

def new
  @owner = Owner.new
  @vehicle = Vehicle.new
  @owners = Owner.all  # or any other appropriate query to fetch owners
end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners or /owners.json
  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to owner_url(@owner), notice: "Owner was successfully created." }
        format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1 or /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to owner_url(@owner), notice: "Owner was successfully updated." }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1 or /owners/1.json
  def destroy
  @owner = Owner.find(params[:id])
  if @owner.destroy
    redirect_to owners_url, notice: "Owner was successfully destroyed."
  else
    redirect_to @owner, alert: "Failed to destroy owner."
  end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def owner_params
      params.require(:owner).permit(:name, :email_address, :contact_number)
    end
end

