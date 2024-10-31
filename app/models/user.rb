class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  
  before_create :generate_confirmation_code

  validates :username, 
    presence: true,
    format: { with: /\A[a-zA-Z0-9 _\.]*\z/ }
  
  validates :type_account, presence: true

  validates :confirmation_code, presence: true, uniqueness: true

  has_many :outgoing_calls, class_name: "Call", foreign_key: "caller"
  has_many :incoming_calls, class_name: "Call", foreign_key: "receiver"

  def confirmed?
    confirmed_at.present?
  end

  def jwt_payload
    super
  end

  private

  def generate_confirmation_code
    self.confirmation_code = SecureRandom.hex(3)
  end
end
