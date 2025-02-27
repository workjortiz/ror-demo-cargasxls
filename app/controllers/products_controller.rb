class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show destroy ]

  def import
    if params[:file].present?
      instance_load = ProductsExcelImporter.new(params[:file]).import
      redirect_to products_path(:instance_load => instance_load), notice: "Proceso de carga Excel carga completado"
    else
      redirect_to products_path, alert: "No hay archivo adjunto"
    end
  end
  
  # GET /products or /products.json
  def index
    @array_bit_error_log = params[:instance_load].present? ? BitLoadData.where(event: "LOAD_EXCEL", model: "PRODUCTS", action: "NEW/ERROR", data1: params[:instance_load]).order(value1: :desc) : nil
    @array_bit_ok_log = params[:instance_load].present? ? BitLoadData.where(event: "LOAD_EXCEL", model: "PRODUCTS", action: "NEW/COMPLETE", data1: params[:instance_load]).order(value1: :desc) : nil
    @products = Product.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.description = @product.description.upcase
    @product.short_code = (Param.generate_nn("NN_PRODUCTS"))
    @product.long_code = Product.generate_long_code(@product.brand, @product.unit_measure)
    @product.base64_code = SecureRandom.base64(10)

    respond_to do |format|
      if !@product.eval_exist && @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:short_code, :long_code, :description, :base64_code, :brand_id, :unit_measure_id)
    end
end
