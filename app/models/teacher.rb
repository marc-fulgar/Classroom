class Teacher < User
  has_one :block_class
  has_many :subjects
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, on: :update, uniqueness: true, length: {minimum: 4, maximum: 50}
  validates :first_name, :last_name, on: :update, allow_blank: true, presence: true
  validates :password, on: :create, presence: true
  validates :password, on: :update, allow_blank: true, presence: true
  validates_confirmation_of :password
end
