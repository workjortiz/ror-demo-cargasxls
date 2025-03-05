class ClientsController < ApplicationController
  before_action :set_client, only: %i[ edit update destroy ]

  # GET /clients or /clients.json
  def index
    @filter = params["filter"].present? ? params["filter"].upcase : ""
    @clients = Client.where("fiscal_name LIKE '%#{@filter}%' OR comercial_name LIKE '%#{@filter}%' ")
                    .order(created_at: :desc)
                    .paginate(page: params[:page], per_page: 10)
  end

  def info
    @client = Client.find_by_base64_code(params[:access])
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: "Client was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: "Client was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy!

    respond_to do |format|
      format.html { redirect_to clients_path, status: :see_other, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:fiscal_name, :comercial_name, :fiscal_address, :comercial_address, :base64_code, :country_id, :taxrule_id, :currency_id)
    end
end
