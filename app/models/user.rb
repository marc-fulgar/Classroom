class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :username, presence: true, uniqueness: true, length: {minimum: 4, maximum: 20}, format: { with: /\A[a-zA-Z0-9]+\z/, message: "can only include letters and numbers" }
  validates :email, presence: true, uniqueness: true, length: {minimum: 4, maximum: 50}
  validates :first_name, :last_name, presence: true
  validates :password, on: :create, presence: true
  validates :password, on: :update, allow_blank: true, presence: true
  validates_confirmation_of :password
         
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
    try(is_admin)
  end
end
