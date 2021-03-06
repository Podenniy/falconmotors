class Users::SessionsController < Devise::SessionsController
  before_action :search_parts

  

  def resource_params
    params.permit(:user).permit(:address, :first_name, :last_name, :patronymic, :user_telephon, :user_login ,:user_organization, :legal_entity, :email, :name, :password, :password_confirmation, :remember_me, :role_ids)
  end
  
  
  private :resource_params

    def search_parts
       @search_spares = SparePart.search(params[:q])
       @spare_parts = @search_spares.result(distinct: true)
    end
end