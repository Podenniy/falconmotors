class Category < ActiveRecord::Base

  has_many :spare_parts
  belongs_to :parent, :class_name => "Category" 
  has_many :children,  :class_name => "Category",:foreign_key => "parent_id",:dependent => :destroy
  has_many :brends
end
