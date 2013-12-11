class PricePart < ActiveRecord::Base
	belongs_to :supplier
	belongs_to :spare_part
	has_many :line_items



end
