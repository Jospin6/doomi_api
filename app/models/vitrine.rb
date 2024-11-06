class Vitrine < ApplicationRecord
    belongs_to :user
    has_many :follewers
    has_many :notes

    def moyenne_notes
        return 0 if notes.empty?
        notes.average(:note).to_f.round(2)
    end
    
end
