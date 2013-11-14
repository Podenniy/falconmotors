class User < ActiveRecord::Base
  has_many :users_roles
  has_many :roles, :through => :users_roles
  has_many :orders
  validates :first_name, :last_name, :email, :patronymic, :user_telephon, :user_login,
            :presence => true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  
end
