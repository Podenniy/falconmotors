class Users::RegistrationsController < Devise::RegistrationsController
  before_action :search_parts
  
  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(resource_params)
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(resource_params)
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end
  def edit_personal_data
    resource = current_user
    render "edit"
  end

  def resource_params
    params.require(:user).permit( :city, :address, :first_name, :last_name, :patronymic, :user_telephon, :user_login ,:user_organization, :legal_entity, :email,  :password, :password_confirmation, :remember_me, :role_ids, :current_password)
  end
  private :resource_params 

    def needs_password?(user, params)
      user.user_login != params[:user][:user_login] ||
      params[:user][:password].present?
    end 

   
    def search_parts
       @search_spares = SparePart.search(params[:q])
       @spare_parts = @search_spares.result(distinct: true)
    end
    
end