class Evaluation < ApplicationRecord
    belongs_to :evaluationable, polymorphic: true
end
