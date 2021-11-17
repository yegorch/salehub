class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :update, :edit, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Товар сохранен"
      redirect_to root_path
    else
      flash[:alert] = "Товар сохранен"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def find_product
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :image_url)
  end
end
