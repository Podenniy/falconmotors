class LineItemsController < InheritedResources::Base
  load_and_authorize_resource :only => [:index, :show]
  before_action :search_parts
  before_action :cart
   
  respond_to :js, :only => [:create,  :update, :destroy]
  respond_to :json, :only => [:create, :update, :destroy]
  
  def create
    price = PricePart.find(params[:price_id])    
    unless @cart.line_items.find_by_price_part_id(price) 
      @line_item = @cart.add_price_part( price.id)
      create!( notice: " Позиция была успешно создана ") { @line_item.cart }
    else
      logger.error "Попытка добавить дублирующий товар #{params[:id]}"
      create!( notice:  " Предложение выбранного поставщика уже есть в корзине. Выберите другой товар или вариант поставки " ) { @cart }
     end
       
  end
    
    
   


  def update
    @line_item = LineItem.find(params[:id])
    @quantity_l =  @line_item.price_part.quantity
    if @line_item.update(line_params)
      unless @line_item.quantity   >  @quantity_l
        update!(notice: "у вас в корзине #{@line_item.quantity} шт, #{@line_item.price_part.spare_part.brend.title} #{@line_item.price_part.spare_part.title}") { @cart }
       else
        logger.error "Попытка добавить больше товара #{params[:id]}"
        update!(notice: " Указаное колличество привышает колличество на складе!!! #{@quantity_l}  это на данный момент максимальное количество!!!") { @cart } 
        @current_item = @lineitem
        @line_item.update_attributes(quantity: @quantity_l ) 
      end
    end
  end
   
 
  def destroy
    @line_item = LineItem.find(params[:id])
    destroy! do |format|
      format.html {redirect_to @cart}
      format.js {@current_item = @line_item}
      format.json { render json: @line_item.errors, status: :unprocessable_entity }
    end
  end



  private
    def permitted_params
      params.permit(:line_item =>[:spare_part_id, :cart_id, :quantity, :price, :price_part_id])
    end

    def line_params
      params.require(:line_item).permit(:spare_part_id, :cart_id, :quantity, :price, :price_part_id)
    end

    def cart
      @cart = current_cart
    end

    def search_parts
       @search_spares = SparePart.search(params[:q])
       @spare_parts = @search_spares.result(distinct: true)
    end
end
