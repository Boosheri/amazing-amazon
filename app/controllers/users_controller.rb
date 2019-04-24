class UsersController < ApplicationController
  before_action :admin_check!, only: [:admin]
  before_action :authenticate_user!, only: [:admin]
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def admin_check!
    @users = User.order(created_at: :desc)
    @products = Product.order(created_at: :desc)
    @reviews = Review.order(created_at: :desc)
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def authorize_admin!
    redirect_to root_path, alert: 'Access denied!' unless current_user.admin?
  end
  
end
