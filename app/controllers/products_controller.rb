class ProductsController < ApplicationController

  def index
    @products = Product.includes(:product_images).order("created_at DESC").limit(10)
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

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
      if product.destroy
        redirect_to root_path
      else
        redirect_to product_path
      end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :size, :condition, :delivery_charge, :delivery_way, :prefecture_id, :delivery_days, :price, :status, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
