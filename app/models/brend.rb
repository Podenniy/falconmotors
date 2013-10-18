class Brend < ActiveRecord::Base
 belongs_to :supplier
 has_many :spare_parts
  mount_uploader :image, ImageUploader
end
