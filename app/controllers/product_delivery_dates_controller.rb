class ProductDeliveryDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product_delivery_date, only: [:edit, :update, :destroy]

  def index
    @product_delivery_dates = ProductDeliveryDate.all
    @products = Product.all
  end

  def new
    @product_delivery_date = ProductDeliveryDate.new
    @products = Product.all
  end

  def create
    @product_delivery_date = ProductDeliveryDate.new(product_delivery_date_params)
    if @product_delivery_date.save!
      redirect_to product_delivery_dates_path, notice:  'Product_delivery_date was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product_delivery_date.update(product_delivery_date_params)
      redirect_to product_delivery_dates_path, notice: 'Product_delivery_date was successfully updated.'
    else
      render :new
    end
  end

  def edit
    @product_delivery_dates = ProductDeliveryDate.all
    @products = Product.all
  end

  def destroy
    @product_delivery_date.destroy
    redirect_to product_delivery_dates_path, notice: 'Product_delivery_date was successfully destroyed.'
  end

  def archive_all
    @product_delivery_dates = ProductDeliveryDate.all
    @product_delivery_dates.each do |product_delivery_date|
      product_delivery_date.archive = true
      product_delivery_date.save
    end
    redirect_to product_delivery_dates_path, notice: 'Product_delivery_date was successfully archived.'
  end

  private
  def set_product_delivery_date
    @product_delivery_date = ProductDeliveryDate.find(params[:id])
  end

  def product_delivery_date_params
    params.require(:product_delivery_date).permit(:deliveryDate, :archive)
  end
end
