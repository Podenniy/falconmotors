class PricePartsController < InheritedResources::Base
  before_action :menu
  before_action :cart
  before_action :search_parts

  private
    def permitted_params
        params.permit(:price_part => [:price, :quantity, :delivery, :supplier_id , :spare_part_id] )
    end

    def part_params
      params.require(:price_part).permit(:price, :quantity, :delivery, :supplier_id , :spare_part_id)
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