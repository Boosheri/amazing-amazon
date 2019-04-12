class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]



  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit(:title, :description, :price)
    @product = Product.new product_params
    @product.user = current_user
    if @product.save
      puts "product saved!"
      # The redirect_to method is used for telling the
      # browser to make a new request.
      # The redirect_to method is typically used with
      # with a named route helper.
      redirect_to product_path(@product[:id])
    else
      render :new
    end
  end
  
  def index
    # @products = Product.all
    @products = Product.order(created_at: :DESC)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @reviews = @product.reviews.order(created_at: :desc)
  end

  def edit
    @product = Product.find params[:id]
  end
  
  def update
    product_params = params.require(:product).permit(:title, :description, :price)
    @product = Product.find params[:id]
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
  end
    
    def destroy
      @product = Product.find params[:id]
      @product.destroy
      redirect_to products_path
    end

    private

    def find_product
      @product = Product.find params[:id]
    end
    def product_params
    params.require(:product).permit(:title, :description, :price)
    end
end
