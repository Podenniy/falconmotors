class BrendsController < InheritedResources::Base
  before_action :cart
  before_action :menu
  before_action :sear
  before_action :resource
  private
    def permitted_params
        params.permit(:brend => [:title, :descriptions, :image, :image_cache, :quantity, :price, :photos, :add_quantity , :parent_id, :supplier_id, :spare_part_id] )
    end

    def part_params
      params.require(:brend).permit(:title, :descriptions, :image, :image_cache, :quantity, :price, :photos, :add_quantity, :parent_id, :supplier_id, :spare_part_id)
    end

     def sear
      @search = search_parts
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
end
