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

  after_create :create_compte_info

  has_many :outgoing_calls, class_name: "Call", foreign_key: "caller"
  has_many :incoming_calls, class_name: "Call", foreign_key: "receiver"
  has_one :compte_info, class_name: "CompteInfo", foreign_key: "user_id"
  


  def jwt_payload
    super
  end

  def update_confirmation_code
    new_confirmation_code = generate_confirmation_code
    compte_info = CompteInfo.find_by(user_id: self.id)
    if compte_info
      compte_info.update(confirmation_code: new_confirmation_code)
    end
  end

  private

  def create_compte_info
    confirmation_code = generate_confirmation_code
    CompteInfo.create(user_id: self.id, confirmation_code: confirmation_code)
  end

  def generate_confirmation_code
    SecureRandom.random_number(1000000).to_s.rjust(6, '0')
  end
  
end
