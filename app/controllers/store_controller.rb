class StoreController < ApplicationController
  before_action :cart
  before_action :menu
  before_action :user_f
  before_action :search_parts
  def index
  	
  	@category = Category.all.where(:name => "Универсальные товары")

  	@search_spares = SparePart.search(params[:q])
    @spare_parts = @search_spares.result(distinct: true)
  end
  def cooperation
    
  end

  def contact
    
  end

  def useful_info
    
  end
  
  private
   def user_f
     @user = current_user
   end
   def menu
     @category_menu = category_menu
   end
   def cart
      @cart = current_cart
  end

  def search_parts
      @search_spares = SparePart.search(params[:q])
      @spare_parts = @search_spares.result(distinct: true)

  end
end
