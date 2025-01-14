class UnitMeasuresController < ApplicationController
  before_action :set_unit_measure, only: %i[ show edit update destroy ]

  # GET /unit_measures or /unit_measures.json
  def index
    @unit_measures = UnitMeasure.all
  end

  # GET /unit_measures/1 or /unit_measures/1.json
  def show
  end

  # GET /unit_measures/new
  def new
    @unit_measure = UnitMeasure.new
  end

  # GET /unit_measures/1/edit
  def edit
  end

  # POST /unit_measures or /unit_measures.json
  def create
    @unit_measure = UnitMeasure.new(unit_measure_params)

    respond_to do |format|
      if @unit_measure.save
        format.html { redirect_to @unit_measure, notice: "Unit measure was successfully created." }
        format.json { render :show, status: :created, location: @unit_measure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unit_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_measures/1 or /unit_measures/1.json
  def update
    respond_to do |format|
      if @unit_measure.update(unit_measure_params)
        format.html { redirect_to @unit_measure, notice: "Unit measure was successfully updated." }
        format.json { render :show, status: :ok, location: @unit_measure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unit_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_measures/1 or /unit_measures/1.json
  def destroy
    @unit_measure.destroy!

    respond_to do |format|
      format.html { redirect_to unit_measures_path, status: :see_other, notice: "Unit measure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_measure
      @unit_measure = UnitMeasure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unit_measure_params
      params.require(:unit_measure).permit(:name, :iso_code)
    end
end
