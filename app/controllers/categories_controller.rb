class CategoriesController < InheritedResources::Base
   load_and_authorize_resource
   before_action :cart
   before_action :search_parts
  
   

  private

    def permitted_params
      params.permit(:category => [ :image, :name, :category_id, :parent, :parent_id , :children ,:product_id])
    end

    def search_parts
      @search_spares = SparePart.search(params[:q])
      @spare_parts = @search_spares.result(distinct: true)
    end

    def cart
      @cart = current_cart
    end

    def cur_user
      @user = current_user
    end
    
end
