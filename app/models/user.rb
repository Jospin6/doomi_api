class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  

  validates :username, 
    presence: true,
    format: { with: /\A[a-zA-Z0-9 _\.]*\z/ }
  
  validates :type_account, presence: true

  validates :confirmation_code, presence: true, uniqueness: true

  after_create :create_compte_info

  has_many :outgoing_calls, class_name: "Call", foreign_key: "caller"
  has_many :incoming_calls, class_name: "Call", foreign_key: "receiver"
  has_one :compte_info, class_name: "CompteInfo", foreign_key: "user_id"
  


  def jwt_payload
    super
  end

  private

  def create_compte_info
    create_compte_info(user_id: self.id)
  end
  
end
