class ReviewsController < ApplicationController
   
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :authorize!, only: [:edit, :destroy, :update]

    def create
        @product = Product.find(params[:product_id])
        @review = Review.new review_params
        @review.product = @product
        @review.user = current_user
        if @review.save
            redirect_to product_path(@product)
        else
            @reviews = @product.reviews.order(created_at: :desc)
            render 'products/show'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        redirect_to(@review.product)
        if can?(:crud, @answer)
            @review.destroy
            redirect_to product_path(@review.product)
          else
            # head will send an empty HTTP response with a particular reponse code
            # in this case :unauthorized code is 401
            # http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/
            head :unauthorized
          end
    end

    private
    
      def review_params
        params.require(:review).permit(:rating, :body)
      end

      def find_review
        @review = Review.find(params[:id])
      end

    def authorize!
        redirect_to home_path, alert: "access denied" unless can? :crud, @review
    end
end