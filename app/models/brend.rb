class Brend < ActiveRecord::Base

 has_and_belongs_to_many :suppliers
 has_many :spare_parts
 mount_uploader :image, ImageUploader
end
