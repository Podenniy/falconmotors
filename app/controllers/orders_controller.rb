class OrdersController < InheritedResources::Base
  before_action :cart
  before_action :search_parts
 
  respond_to :html, :json, :only => [:new, :index, :show, :edit, :destroy, :update]

  def index
    @user = current_user
    @orders = Order.all.where(user_id:@user.id).paginate page: params[:page], order: 'created_at desc', per_page: 10

    index!
  end

  def orders_search
    @user = current_user
    @search_orders = Order.where(user_id:@user.id).search(params[:q])
    @orders = @search_orders.result(distinct: true)
    @search_orders.build_condition 
    @search_orders.build_sort if @search_orders.sorts.empty?
    @orders 
    render "orders_search"
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
    @order = Order.new(permitted_params)
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
        #params.permit(:order => [:user_id, :name, :address, :email, :pay_type, :spare_part_id, :delivery_method_id, :pyment_type_id] )
        #{:order => params.fetch(:order, {}).permit(:user_id, :name, :address, :email, :pay_type, :spare_part_id, :delivery_method_id, :pyment_type_id)}
        params.fetch(:order, {}).permit(:user_id, :name, :address, :email, :pay_type, :spare_part_id, :delivery_method_id, :pyment_type_id)
    end
     


    def search_parts
      @search_spares = SparePart.search(params[:q])
      @spare_parts = @search_spares.result(distinct: true)
    end

    def cart
      @cart = current_cart
    end
    
    
end
