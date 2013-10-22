class CartsController < InheritedResources::Base
  before_action :cart
  before_action :menu
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
    def menu
      @category_menu = category_menu
    end

    def cart
      @cart = current_cart
    end

    def sear
      @search = search_parts
    end
    
    def cart_params
      params[:cart]
    end
end
