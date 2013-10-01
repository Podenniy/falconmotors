class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   @category_menu = Category.all.where(:parent_id => nil)

  

  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.cart_id
      cart
    end
    
    def category_menu
      @category_menu = Category.all.where(:parent_id => nil)
    end
    
end
