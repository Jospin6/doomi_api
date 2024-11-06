class Recommandation < ApplicationRecord
    belongs_to :recommandable, polymorphic: true
end
