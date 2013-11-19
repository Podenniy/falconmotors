class CategoriesController < InheritedResources::Base
   load_and_authorize_resource
   before_action :cart
   before_action :search_parts
   before_action :resource
   before_action :find, :only => [:show, :destroy,  :update]
   before_action :cur_user
  
   def new
    authorize! 
    @category = Category.new
    new!

   end

  
   def destroy
    @category.destroy
    destroy!
   end

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
    
    def menu
      @category_menu = category_menu
    end

    def resource
      @resource ||= User.new
    end
    def cur_user
      @user = current_user
    end
    def find
      @category = Category.find(params[:id])
    end
end
