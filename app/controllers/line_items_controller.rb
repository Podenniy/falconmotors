class LineItemsController < InheritedResources::Base
   before_action :menu
   before_action :search_parts
   before_action :cart
   respond_to :html, :json
   respond_to :js, :only => [:create, :update]

   
   def create
     spare_part = SparePart.find(params[:spare_part_id])
   
     if spare_part.line_items.empty? || @cart.line_items.empty?
       @line_item = @cart.add_spare_part( spare_part.id)
       create!(notice: " Позиция была успешно создана ") { @line_item.cart }
     else
       logger.error "Попытка добавить дублирующий товар #{params[:id]}"
       create!(notice: " Предложение выбранного поставщика уже есть в корзине. Выберите другой товар или вариант поставки " ) { @cart }
     end
   end


   def update
      @line_item = LineItem.find(params[:id])
      @quantity_l =  @line_item.spare_part.quantity
    if @line_item.update(line_params)  
      unless @line_item.quantity > @quantity_l
        update!{ @cart }
       else
         super do |format|
           @line_item.update_attributes(quantity: @quantity_l )
           logger.error "Попытка добавить больше товара #{params[:id]}"
           format.html {render @cart, notice: " Указаное колличество привышает колличество на складе!!! #{@quantity_l}  это на данный момент максимальное количество!!!"}
           format.js 
           format.json { render json: @line_item.errors, status: :unprocessable_entity }
         end
       end
    end
   end
    #update! do |format|
    #  unless @line_item.quantity > @line_item.spare_part.quantity
    #    format.html { redirect_to @cart }
    #    format.js
    #    format.json { head :no_content }
    #  else
    #      @quantity_l =  @line_item.spare_part.quantity
    #      @line_item.update_attributes(quantity: @quantity_l )
    #    format.html { redirect_to @cart, notice: " Указаное колличество привышает колличество на складе!!! #{@quantity_l}  это на данный момент максимальное количество!!!"}
    #    format.js 
    #  end
    #end
    
   
   #def update
   #  @line_item = LineItem.find(params[:id])
#
   #  super do |format|
   #    if @line_item.update(line_params)
#
   #      unless @line_item.quantity > @line_item.spare_part.quantity 
#
   #        format.html { redirect_to @cart  }
   #        format.js
   #        format.json { head :no_content }
   #         
   #      else
   #        
   #          @quantity_l =  @line_item.spare_part.quantity
   #          @line_item.update_attributes(quantity: @quantity_l )
   #        
   #          format.html { redirect_to @cart, notice: " Указаное колличество привышает колличество на складе!!! #{@quantity_l}  это на данный момент максимальное количество!!!"}
   #          format.js 
   #          format.json { render json: @line_item.errors, status: :unprocessable_entity }
   #          
   #      end
   #      
   #    end
   #  end
   #end
 
 def destroy
  
  destroy!{@cart}
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
