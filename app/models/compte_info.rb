class CompteInfo < ApplicationRecord
  belongs_to :user

  def confirmed?
    confirmed_at.present?
  end

  
end
