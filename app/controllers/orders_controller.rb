class OrdersController < InheritedResources::Base
  before_action :menu
  before_action :cart
  before_action :search_parts
  respond_to :html, :json, :only => [:new]

  def new
  	if@cart.line_items.empty?
      new!(notice: "Ваша карта пуста"){ store_url }
      return
  	end
  	@order = Order.new
    new!
  end

  private
    def permitted_params
        params.permit(:supplier => [:name, :address, :email, :pay_type, :spare_part_id] )
    end

    def supplier_params
      params.require(:supplier).permit(:name, :delivery, :price,:quantity, :spare_part_id)
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
