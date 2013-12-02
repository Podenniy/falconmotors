class UsersController < ApplicationController
  before_action :user_cur
  before_action :search_parts
  before_action :cart

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      
      redirect_to @user, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
    
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to @user, :flash => { :success => 'User was successfully updated.' }
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'User was successfully deleted.' }
  end

  def orders_us
    @user.orders = @us_orders
    @us_orders_search =  @us_orders.search(params[:q])
    @spare_parts = @search_spares.result(distinct: true)
    
  end
  
  def personal_data
    
    render 'personal_data'
    
  end
  private

    def permitted_params
      params.permit(:user => [:city, :address, :first_name, :last_name, :patronymic, :user_telephon, :user_login ,:user_organization, :legal_entity, :email,  :password, :password_confirmation, :remember_me, :role_ids]) 
    end

    def user_cur
      @user = current_user
    end
    def search_parts
      @search_spares = SparePart.search(params[:q])
      @spare_parts = @search_spares.result(distinct: true)
    end

    def cart
      @cart = current_cart
    end
end
