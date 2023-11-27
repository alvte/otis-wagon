class ProductsController < ApplicationController
  def show; end

  # only for admin users
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @product.update(product_params)
  end

  def destroy
    @product.destroy
    redirect_to root_path status: :see_other
  end

  private

  def find
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, photos: [])
  end
end
