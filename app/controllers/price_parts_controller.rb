class PricePartsController < InheritedResources::Base
  load_and_authorize_resource :only => [:index, :show]
  before_action :cart
  before_action :search_parts
  before_action :user_resource
  before_action :cur_user
  

  private

    def permitted_params
      params.permit(:price_part => [:price, :quantity, :delivery, :supplier_id , :spare_part_id])   
    end

    def search_parts
      @search_spares = SparePart.search(params[:q])
      @spare_parts = @search_spares.result(distinct: true)
    end

    def cart
      @cart = current_cart
    end
    def user_resource
      @resource ||= User.new
    end
    def cur_user
      @user = current_user
    end
    def set_price
      @price_part = PricePart.find(params[:id])
    end
end
