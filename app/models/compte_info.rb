class CompteInfo < ApplicationRecord
  belongs_to :user
  after_create :generate_confirmation_code

  def confirmed?
    confirmed_at.present?
  end

  def generate_confirmation_code
    self.confirmation_code = SecureRandom.random_number(1000000).to_s.rjust(6, '0')
  end
end
