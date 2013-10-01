class CategoriesController < InheritedResources::Base
   before_action :menu


   def new
  	@category = Category.new
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
    super
  end

  

  

  def menu
    @category_menu = category_menu
  end
  private
    def permitted_params
      params.permit(:category => [:name, :category_id, :parent, 
      :parent_id , :children ,:product_id])
    end
end
