class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
    @product.product_images.new
  end

  def create
    @product = Product.new(product_params)
    #binding.pry
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :size, :condition, :delivery_charge, :delivery_way, :prefecture_id, :delivery_days, :price, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
