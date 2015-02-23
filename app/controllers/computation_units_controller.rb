class ComputationUnitsController < ApplicationController
  before_action :set_computation_unit, only: [:show, :edit, :update, :destroy]

  # GET /computation_units
  # GET /computation_units.json
  def index
    @computation_units = ComputationUnit.all
  end

  # GET /computation_units/1
  # GET /computation_units/1.json
  def show
  end

  # GET /computation_units/new
  def new
    @computation_unit = ComputationUnit.new
  end

  # GET /computation_units/1/edit
  def edit
  end

  # POST /computation_units
  # POST /computation_units.json
  def create
    params[:computation_unit][:added] = Time.now
    @computation_unit = ComputationUnit.new(computation_unit_params_edit)

    respond_to do |format|
      if @computation_unit.save
        format.html { redirect_to @computation_unit, notice: 'Computation unit was successfully created.' }
        format.json { render :show, status: :created, location: @computation_unit }
      else
        format.html { render :new }
        format.json { render json: @computation_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computation_units/1
  # PATCH/PUT /computation_units/1.json
  def update
        params[:computation_unit][:updated] = Time.now
    respond_to do |format|
      if @computation_unit.update(computation_unit_params_edit)
        format.html { redirect_to @computation_unit, notice: 'Computation unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @computation_unit }
      else
        format.html { render :edit }
        format.json { render json: @computation_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computation_units/1
  # DELETE /computation_units/1.json
  def destroy
    @computation_unit.destroy
    respond_to do |format|
      format.html { redirect_to computation_units_url, notice: 'Computation unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computation_unit
      @computation_unit = ComputationUnit.find(params[:id])
    end

     def computation_unit_params_edit
      params.require(:computation_unit).permit(:ram, :CPU_Cores, :CPU_Clock, :storage_as_string, :ip, :uplink, :downlink, :online, :name, :location, :added, :updated)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computation_unit_params
      params.require(:computation_unit).permit(:ram, :CPU_Cores, :CPU_Clock, :storage, :ip, :uplink, :downlink, :online, :name, :location, :added, :updated)
    end
end
