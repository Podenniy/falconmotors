class StoreController < ApplicationController
 
  before_action :menu
  before_action :user_f
  def index
  	
  	@category_menu = Category.all.where(:parent_id => nil)

  	@search_spares = SparePart.search(params[:q])
    @spare_parts = @search_spares.result(distinct: true)
  end


  private
   def user_f
     @user = current_user
   end
   def menu
     @category_menu = category_menu
   end
end
