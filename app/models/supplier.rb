class Supplier < ActiveRecord::Base
 
 has_many :price_parts
 has_and_belongs_to_many :brends
 

end
