class ProductsController < ApplicationController
  before_action :set_product, only:[:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :judge_admin, only:[:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice:"投稿完了"
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
      redirect_to products_path, notice:"更新完了"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice:"削除完了"
  end

  def search
    @products = Product.search_name(params[:keyword])
  end

  private
  def product_params
    params.require(:product).permit(:name, {product_images: []}, :description)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def judge_admin
    unless current_user.admin_flag == true
      redirect_to posts_path
    end
  end

end
