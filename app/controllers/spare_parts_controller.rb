class SparePartsController < InheritedResources::Base

  before_action :menu
  before_action :cart
  before_action :search_parts

  def update
   @spare_part = SparePart.find(params[:id])
    respond_to do |format|
      if @spare_part.update(part_params)

        format.html { redirect_to action: :index, notice: 'Product was successfully updated.' }
        
        format.json { head :no_content }
        
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  def search
    SparePart
    render 'search_table'
  end
  
  private
    def permitted_params
        params.permit(:spare_part => [:title, :descriptions, :image, :image_cache, :quantity, :price,:photos, :add_quantity, :brend_id, :parent,  :parent_id] )
    end

    def part_params
      params.require(:spare_part).permit(:title, :descriptions, :image, :image_cache, :quantity, :price,:photos, :add_quantity, :brend_id, :parent,  :parent_id)
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
