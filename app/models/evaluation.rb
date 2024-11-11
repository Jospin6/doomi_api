class Evaluation < ApplicationRecord
    belongs_to :evaluationable, polymorphic: true
    validates :evaluation, presence: true, inclusion: { in: 0..5 }
end
