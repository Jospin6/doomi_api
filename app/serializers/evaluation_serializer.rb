class EvaluationSerializer < ActiveModel::Serializer
  attributes :id, :evaluationable_type, :evaluationable_id, :evaluation
end
