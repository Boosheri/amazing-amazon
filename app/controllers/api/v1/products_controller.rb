class Api::V1::ProductsController < Api::ApplicationController
    before_action :authenticate_user!, only: [ :create ]

    def index
        products = Product.order(created_at: :desc)
        render json: products, each_serializer: ProductCollectionSerializer
    end
    
    def show
        find_product
        render json: product
    end

    def create
        
        product = Product.new product_params
        product.user = current_user

            if product.save
                render json: { id: product.id }
            else
                render(
                json: { errors: product.errors.messages },
                status: 422 # Unprocessable Entity
                )
            end
    end

    private

    def product
        @product ||= Product.find params[:id]
    end

    def product_params
        params.require(:product).permit(:title, :description, :price)
    end

end


