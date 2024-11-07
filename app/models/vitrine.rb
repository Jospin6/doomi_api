class Vitrine < ApplicationRecord
    belongs_to :user
    has_many :follewers
    has_many :notes
    has_many :recommandations, as: :recommandable
    has_many :notifications, as: :notificationable

    def moyenne_notes
        return 0 if notes.empty?
        notes.average(:note).to_f.round(2)
    end
    
end
