class BrendsController < InheritedResources::Base
  load_and_authorize_resource
  before_action :cart
  before_action :menu
  before_action :sear
  before_action :set_brend, only: [:show, :edit, :update, :destroy]      
  respond_to :html, :json
  
  
  
  private
  
    def permitted_params
      params.permit(:brend => [:title, :description, :image, :image_cache, :quantity, :price, :photos, :add_quantity , :parent_id, :supplier_id, :spare_part_id])   
    end

    def sear
     @search = search_parts
    end

    def cart
      @cart = current_cart
    end

    def set_brend
       @brend = Brend.find(params[:id])
    end

    def menu
      @category_menu = category_menu
    end

    def user_resource
      @resource ||= User.new
    end
end
