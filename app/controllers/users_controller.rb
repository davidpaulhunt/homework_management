class UsersController < ApplicationController

  skip_filter :ensure_logged_in, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "Account created!"
    else
      render :new, notice: "Sorry, registration failed."
    end
  end

  def index
    @users = get_users(current_user)
    @type = current_user.type
  end

  def show
  end

  def edit
    @user = current_user.is_admin? ? User.find(params[:id]) : current_user
  end
  
  def update
    if @user.update_attributes(user_params)
      choose_path(@user)
    else
      render :edit, notice: "Sorry, there was an error. Please try again later."
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy! unless @user.id == current_user.id
    choose_path(@user)
  end

  private

  def user_params
    params.require(type.underscore.to_sym).permit(:first_name, :last_name, :type, :email, :password, :password_confirmation)
  end

  def set_user
    if User.where(id: params[:id]).exists?
      @user = type_class.find(params[:id])
    else
      @user = current_user
    end
  end

  def set_type 
    @type = type 
  end

  def type 
    params[:type] || "User" 
  end

  def type_class 
    type.constantize 
  end

end
