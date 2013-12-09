class User < ActiveRecord::Base
  has_many :users_roles
  has_many :roles, :through => :users_roles
  has_many :orders
  has_many :vin_cods

  after_create :usr_role

  validates :first_name, :last_name, :email, :city,:patronymic, :user_telephon, :user_login,
            :presence => true
  validates_format_of :user_telephon, :with => /([0-9]{1,})/
  validates_length_of :user_telephon, :minimum => 9, :maximum => 9
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 def usr_role
  rol_f = Role.where(name:"private_person")
  rol_t = Role.where(name:"legal_entity")
  if self.legal_entity == true
    self.roles << rol_t
  else
    self.roles << rol_f
  end
 end
 
 def has_role?(role_sym)
  roles.any? { |r| r.name.underscore.to_sym == role_sym }
 end
end
