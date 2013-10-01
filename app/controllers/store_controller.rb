class StoreController < ApplicationController
  before_action :menu

  def index
  	
  	@category_menu = Category.all.where(:parent_id => nil)

  	@search_spares = SparePart.search(params[:q])
    @spare_parts = @search_spares.result(distinct: true)
  end


  
  def menu
    @category_menu = category_menu
  end
end
