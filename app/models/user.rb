class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_reader
  acts_as_readable on: :updated_at
  
  before_destroy :ensure_not_admin
  has_many :comments
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "200x200>", icon:"100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_confirmation_of :password
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, on: :update, uniqueness: true, length: {minimum: 4, maximum: 50}
  validates :first_name, :last_name, on: :update, allow_blank: true, presence: true
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
    try(:is_admin)
  end
  
  def email_required?
    false
  end
  
  def password_required?
    false
  end
  
  def icon_url
    self.avatar.url(:icon)
  end
  
private
  def ensure_not_admin
    if self.admin?
      throw(:abort)
    end
  end
end