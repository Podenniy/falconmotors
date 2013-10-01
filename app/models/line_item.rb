class LineItem < ActiveRecord::Base
  belongs_to :spare_part
  belongs_to :cart
end
