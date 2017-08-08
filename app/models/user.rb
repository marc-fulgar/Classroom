class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  before_destroy :ensure_not_admin
  
  has_many :comments
         
  def self.races
    %w(Teacher Student)
  end
             
  def email_required?
   false
  end
  
  def type?(usertype)
    usertype == type
  end
  
  def admin?
    try(:is_admin)
  end
  
  private
  def ensure_not_admin
    if self.admin?
      throw(:abort)
    end
  end
end
