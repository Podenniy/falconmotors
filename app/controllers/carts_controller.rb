class CartsController < InheritedResources::Base
  before_filter :authenticate_user!
  before_action :cart
  before_action :sear
  respond_to :html, :json

  def show
    
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error"Попытка доступа к несуществующей корзине #{params[:id]}"
      redirect_to store_url, notice: 'Несуществующая корзина'
    else
      respond_to do |format|
        format.html #show.html.haml
        format.js
        format.json { render  json:@cart }
      end
    end
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    destroy!{ store_url }
    
  end

  private
   def permitted_params
     params.permit(:cart => [])   
   end
    def cart
      @cart = current_cart
    end

    def sear
      @search = search_parts
    end
    
    
end
