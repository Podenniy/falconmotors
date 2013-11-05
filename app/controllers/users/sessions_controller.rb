class Users::SessionsController < Devise::SessionsController
  before_action :search_parts
  def resource_params
    params.permit(:user).permit( :email)
  end

  
  private :resource_params

   def search_parts
       @search_spares = SparePart.search(params[:q])
       @spare_parts = @search_spares.result(distinct: true)
    end
end