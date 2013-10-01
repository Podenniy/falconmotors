class LineItemsController < InheritedResources::Base

  private
    def permitted_params
      params.permit(:lineitem =>[:spare_part_id, :cart_id, :quantity])
    end
end
