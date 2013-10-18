class Supplier < ActiveRecord::Base
 
 has_many :price_parts
 has_many :brends
 

end
