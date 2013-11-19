class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?
  include BootstrapFlashHelper
  include ContentHelper
  protect_from_forgery with: :exception
  
   @category_menu = Category.all.where(:parent_id => nil)




  
  protected
    def configure_permitted_parameters
       devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_addres, :first_name, :last_name, :patronymic, :user_telephon, :user_login ,:user_organization, :legal_entity, :email, :password, :password_confirmation, :remember_me, :role_ids)}
    end
  private
    rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = exception.message
        redirect_to store_url
    end
    
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    
    def category_menu
      @category_menu = Category.all.where(:parent_id => nil)
    end
    

    def search_parts
       @search_spares = SparePart.search(params[:q])
       @spare_parts = @search_spares.result(distinct: true)
    end

    def after_sign_in_path_for(user)

        store_url(user)

    end
    def user_f
     @user = current_user
    end
    
end
