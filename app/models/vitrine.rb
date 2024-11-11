class Vitrine < ApplicationRecord
    belongs_to :user
    has_many :follewers
    has_many :evaluations, as: :evaluationable
    has_many :recommandations, as: :recommandable
    has_many :notifications, as: :notificationable

    def moyenne_notes
        return 0 if evaluations.empty?
        evaluations.average(:note).to_f.round(2)
    end
    
end
