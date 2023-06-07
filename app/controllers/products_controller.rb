require 'csv'

class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index

    if params[:search] && !params[:search].empty?
      @products = Product.search_all(params[:search])
    else
      @products = Product.all
    end

    # raise
    if params[:condition].present?
      @products = @products.where(stat: params[:condition])
    end

    respond_to do |format|
      format.html # Rendu de la page HTML normale
      format.json { render json: @products } # Renvoi des produits en format JSON
    end
    
  end

  # GET /products/1 or /products/1.json
  def show
    @products = Product.all
  
    respond_to do |format|
      format.html # Rendu de la page HTML normale
      format.pdf do
        render pdf: "show"
      end
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    @clients = Client.all
    @product_delivery_dates = ProductDeliveryDate.all
  end

  # GET /products/1/edit
  def edit
    @clients = Client.all
    @product_delivery_dates = ProductDeliveryDate.all
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: "Product was successfully created." }
        format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def export_csv
    @products = Product.all

    respond_to do |format|
      format.csv { send_data generate_csv(@products), filename: "products.csv" }
    end
  end

  def export_json
    @products = Product.all

    respond_to do |format|
      format.json { render json: @products }
    end
  end
  
  def export_pdf
    @products = Product.all
  
    respond_to do |format|
      format.pdf do
        render pdf: "show"
      end
    end
  end    

  private

    def generate_csv(products)
      CSV.generate(headers: true, :col_sep => ";") do |csv|
        csv << ["Name", "Number", "Client_id", "created_at", "deliveryDate", "onSite", "stat"] # Ajoute les en-têtes des colonnes

        products.each do |product|
          csv << [product.name, product.number, product.client_id, product.created_at, product.deliveryDate, product.onSite, product.stat] # Ajoute les données de chaque produit
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :number, :deliveryDate, :onSite, :stat, :client_id, :product_delivery_date_id)
    end
end
