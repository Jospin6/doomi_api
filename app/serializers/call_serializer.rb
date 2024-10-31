class CallSerializer < ActiveModel::Serializer
  attributes :id, :caller, :receiver, :call_type, :start_time, :end_time, :status
end
