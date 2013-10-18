class SuppliersController < InheritedResources::Base
  before_action :menu
  before_action :cart
  before_action :search_parts

    def show
      @supplier = Supplier.find(params[:id])
      @spare_parts = @supplier.spare_parts
    end
    def permitted_params
       params.permit(:supplier => [:name, :brend_id, :supplier_id ])
    end

    def part_params
      params.require(:supplier).permit(:name, :brend_id, :supplier_id)
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
