class SuppliersController < InheritedResources::Base
  
  before_action :cart
  before_action :search_parts

    def show
      @supplier = Supplier.find(params[:id])
      @spare_parts = @supplier.spare_parts
      authorize! :read, @supplier
    end
    def permitted_params
       params.permit(:supplier => [:name, :brend_id, :supplier_id ])
    end

    

    def search_parts
      @search_spares = SparePart.search(params[:q])
      @spare_parts = @search_spares.result(distinct: true)

    end

    def cart
      @cart = current_cart
    end
end
