class Brend < ActiveRecord::Base
 has_many :spare_parts
 
  mount_uploader :image, ImageUploader
end
