class VinCodsController < InheritedResources::Base
  before_action :cart
  before_action :menu
  before_action :resource
  before_action :search_parts
  before_action :find_vin, :only => [:show, :edit, :update, :destroy]

  def create
    @user = current_user
    @vin_cod = VinCod.new(vin_cod_params)
    
    
    create! do |format|
      if@vin_cod.save
        @user.vin_cods << @vin_cod
        @vin_cod.user = @user
        VinCodNotifier.received(@vin_cod).deliver
        format.html {redirect_to store_url, notice: 'Спасибо за ваш запрос'}
        format.json {render json: @vin_cod, status: :created, location: @vin_cod}
       else
        format.html {render action: "new"}
        format.json {render json: @vin_cod.errors, status: :unprocessable_entity }
      end
    end
  end
  private
     def vin_cod_params
      params.require(:vin_cod).permit(:brend_avto, :model, :year, :volume, :code, :parts_list)
    end
    def premited_params
        params.permit(:vin_cod => [:brend_avto, :model, :year, :volume, :code, :parts_list] )
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
    def find_vin
      @vin_cod = VinCod.find(params[:id])
    end
end
