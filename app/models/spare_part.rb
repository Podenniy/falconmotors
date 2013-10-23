class SparePart < ActiveRecord::Base
  
  has_many :price_parts
  belongs_to :brend
  has_many :orders, through: :line_items
  has_many :line_items
  belongs_to :parent, :class_name => "SparePart" 
  has_many :children,  :class_name => "SparePart",:foreign_key => "parent_id",:dependent => :destroy
  before_destroy :ensure_not_referenced_by_any_line_item
	validates :title, :descriptions,  presence: true
	#validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true,  :length => {
  :minimum => 7,
  :message => "Должно быть 10 символов"
  }
  #validates :image_url, allow_blank: true, format: {
  #with: /\A\.(gif|jpg|png)\z/,
  #	message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
  #}

  mount_uploader :image, ImageUploader
    
   def add_quantity
     "".to_i
   end

   def add_quantity=(add = 1)
     
     if add[1] == '-'
       self.quantity = quantity - add.to_i 
     else
       self.quantity = add.to_i + quantity
     end

   end

  
   
  private
    #убеждаемся в отсутствии товарных позиций
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'существуют товарные позиции')
        return false
      end
    end
end
