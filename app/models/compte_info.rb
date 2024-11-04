class CompteInfo < ApplicationRecord
  belongs_to :user

  def confirmed?
    self.confirmed_at.present?
  end

  
end
