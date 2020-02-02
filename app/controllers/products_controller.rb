class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
    @product.product_images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :size, :condition, :delivery_charge, :delivery_way, :delivery_area, :delivery_days, :price, :status, product_images_attributes: [:image])
  end
end
