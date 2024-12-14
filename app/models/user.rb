class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: self,
         authentication_keys: [:phone_number]
  

  validates :username, 
    presence: true,
    format: { with: /\A[a-zA-Z0-9 _\.]*\z/ }

  # after_create :create_compte_info

  has_many :outgoing_calls, class_name: "Call", foreign_key: "caller"
  has_many :incoming_calls, class_name: "Call", foreign_key: "receiver"
  has_many :achats, class_name: "Transaction", foreign_key: "acheteur", through: :transactions
  has_many :produits
  has_many :notifications
  has_many :user1_id, class_name: "Conversation", foreign_key: "user1_id"
  has_many :user2_id, class_name: "Conversation", foreign_key: "user2_id"
  has_many :favoie_produits

  has_one :compte_info
  has_one :vitrine
  has_one :coordonne

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

  def send_confirmation_sms
    confirmation_code = generate_confirmation_code
    message = TwilioClient.messages.create(
      from: '+13612261784', 
      to: self.phone_number,
      body: "Merci de vous être inscrit sur Doomi, #{self.username}! Voici le code ce confirmation de votre compte #{confirmation_code}"
    )
    puts "Message sent: #{message.sid}"
  end

  def self.find_first_by_auth_conditions(warden_conditions)

    conditions = warden_conditions.dup

    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(phone_number) = :value OR lower(email) = :value",
         value: login.downcase).first
    else
      where(conditions.to_hash).first
    end
  end

  private

  def create_compte_info
    confirmation_code = generate_confirmation_code
    CompteInfo.create(user_id: self.id, confirmation_code: confirmation_code)
  end

  def generate_confirmation_code
    SecureRandom.random_number(100000).to_s.rjust(5, '0')
  end
  
end
