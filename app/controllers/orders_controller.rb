class OrdersController < InheritedResources::Base
  load_and_authorize_resource
  before_action :menu
  before_action :cart
  before_action :search_parts
 
  respond_to :html, :json, :only => [:new, :index, :show, :edit, :destroy, :update]

  def index
    @orders = Order.paginate page: params[:page], order: 'created_at desc', per_page: 10
    index!
  end

  def new
    
    @user = current_user
  	if@cart.line_items.empty?
      new!(notice: "Ваша карта пуста"){ store_url }
      return
  	end
  	@order = Order.new
    new!
  end
  
  def create
    @user = current_user
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(current_cart)
    @order.user_ord(@user)
    create! do |format|
      if@order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id]= nil
        OrderNotifier.received(@order).deliver
        format.html {redirect_to store_url, notice: 'Спасибо за ваш заказ'}
        format.json {render json: @order, status: :created, location: @order}
       else
        @cart = current_cart
        format.html {render action: "new"}
        format.json {render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def permitted_params
        params.permit(:order => [:name, :address, :email, :pay_type, :spare_part_id, :delivery_method_id, :pyment_type_id] )
    end

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type, :spare_part_id, :delivery_method_id, :pyment_type_id)
    end

    def search_parts
      @search_spares = SparePart.search(params[:q])
      @spare_parts = @search_spares.result(distinct: true)
    end

    def cart
      @cart = current_cart
    end
    def find_o
     @order =  Order.find(params[:id])
    end
    def find
      @user = current_user
    end
    def menu
      @category_menu = category_menu
    end
end
