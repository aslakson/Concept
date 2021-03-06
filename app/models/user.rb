class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
  has_and_belongs_to_many :organizations
  has_and_belongs_to_many :roles
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  def get_user
    @current_user = current_user
  end
  
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end
end
