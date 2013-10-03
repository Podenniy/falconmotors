class LineItemsController < InheritedResources::Base
   before_action :menu
   before_action :search_parts
   before_action :cart
   respond_to :html, :json
   
   def create
     spare_part = SparePart.find(params[:spare_part_id])
  
     if spare_part.line_items.empty? || @cart.line_items.empty?
       @line_item = @cart.add_spare_part( spare_part.id)
       create!(:notice => "Позиция была успешно создана") { @line_item.cart }
     else
       logger.error"Попытка добавить дублирующий товар #{params[:id]}"
       redirect_to current_cart, notice: 'Предложение выбранного поставщика уже есть в корзине. Выберите другой товар или вариант поставки' 
     end
   end

   def update
     @line_item = LineItem.find(params[:id])
     respond_to do |format|
     
      if @line_item.update(line_params)
        unless @line_item.quantity > @line_item.spare_part.quantity
          
          format.html { redirect_to @cart  }
          format.json { head :no_content }
        else
         @quantity_l =  @line_item.spare_part.quantity
         @line_item.update_attributes(quantity: @quantity_l )

          format.html { redirect_to @cart, notice: 'Указаное колличество привышает колличество на складе'}
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    end
   end
 
  



  private
    def permitted_params
      params.permit(:line_item =>[:spare_part_id, :cart_id, :quantity])
    end

    def line_params
      params.require(:line_item).permit(:spare_part_id, :cart_id, :quantity)
    end

    def menu
      @category_menu = category_menu
    end 

    def cart
      @cart = current_cart
    end

    def search_parts
       @search_spares = SparePart.search(params[:q])
       @spare_parts = @search_spares.result(distinct: true)
    end
end
