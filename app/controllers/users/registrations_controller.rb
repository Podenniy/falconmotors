class Users::RegistrationsController < Devise::RegistrationsController
	before_action :search_parts
   
  def resource_params
    params.require(:user).permit(  :email, :password, :password_confirmation)
  end
  private :resource_params

    def search_parts
       @search_spares = SparePart.search(params[:q])
       @spare_parts = @search_spares.result(distinct: true)
    end
end