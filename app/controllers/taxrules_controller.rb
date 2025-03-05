class TaxrulesController < ApplicationController
  before_action :set_taxrule, only: %i[ show edit update destroy ]

  # GET /taxrules or /taxrules.json
  def index
    @taxrules = Taxrule.all
  end

  # GET /taxrules/1 or /taxrules/1.json
  def show
  end

  # GET /taxrules/new
  def new
    @taxrule = Taxrule.new
  end

  # GET /taxrules/1/edit
  def edit
  end

  # POST /taxrules or /taxrules.json
  def create
    @taxrule = Taxrule.new(taxrule_params)

    respond_to do |format|
      if @taxrule.save
        format.html { redirect_to @taxrule, notice: "Taxrule was successfully created." }
        format.json { render :show, status: :created, location: @taxrule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @taxrule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taxrules/1 or /taxrules/1.json
  def update
    respond_to do |format|
      if @taxrule.update(taxrule_params)
        format.html { redirect_to @taxrule, notice: "Taxrule was successfully updated." }
        format.json { render :show, status: :ok, location: @taxrule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @taxrule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxrules/1 or /taxrules/1.json
  def destroy
    @taxrule.destroy!

    respond_to do |format|
      format.html { redirect_to taxrules_path, status: :see_other, notice: "Taxrule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taxrule
      @taxrule = Taxrule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def taxrule_params
      params.require(:taxrule).permit(:name, :code, :value_rule)
    end
end
