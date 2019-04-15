class UsersController < ApplicationController
  before_action :admin_check!, only: [:admin]

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

    def admin
      @reviews = Review.all
      @products = Product.all
      @users = User.all
      @user = current_user
    end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

    def admin_check!
    
      unless current_user.is_admin?
        redirect_to home_path, notice: 'not authorized'
    end
  end
  
end
