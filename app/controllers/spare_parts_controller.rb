class SparePartsController < InheritedResources::Base

  include ContentHelper
  before_action :menu
  before_action :cart
  before_action :search_parts
  before_action :resource
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

    if params[:q][:title_cont] == ""
     redirect_to store_url, notice: 'В поиск ничего не было введено'
    else
     if @spare_parts.empty?
      redirect_to store_url, notice: 'По вашему поиску ничего не найдено'
     else
      @user = current_user
      SparePart
      render 'search_table'
     end
    end
    
  end
  
  def who_bought
    @spare_part = SparePart.find(params[:id])
    respond_to do |format|
      format.atom
    end
  end

  private
    def permitted_params
        params.permit(:spare_part => [:title, :descriptions, :image, :image_cache, :quantity, :price,:photos, :add_quantity, :brend_id, :parent,  :parent_id, :supplier_id] )
    end

    def part_params
      params.require(:spare_part).permit(:title, :descriptions, :image, :image_cache, :quantity, :price,:photos, :add_quantity, :brend_id, :parent,  :parent_id, :supplier_id)
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
    
    def resource
      @resource ||= User.new
    end
end
