class CategoriesController < InheritedResources::Base
   before_action :menu
   before_action :cart
   before_action :search_parts

   def new
  	@category = Category.new
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
    super
  end

  

  

  
  private
    def permitted_params
      params.permit(:category => [:name, :category_id, :parent, :parent_id , :children ,:product_id])
    end

    def search_parts
      @search_spares = SparePart.search(params[:q])
      @spare_parts = @search_spares.result(distinct: true)

    end

    def cart
      @cart = current_cart
    end

    def menu
      @category_menu = category_menu
    end
end
