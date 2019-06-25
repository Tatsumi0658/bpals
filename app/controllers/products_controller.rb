class ProductsController < ApplicationController
  before_action :set_product, only:[:edit, :update, :show, :destroy]
  def index
    @products = Product.all
    @pr = Product.ransack(params[:pr], search_key: :pr)
    @products = @pr.result
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product_comments = @product.product_comments
    @product_comment = @product.product_comments.build
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, {product_images: []}, :description)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
