class ALaUne < ApplicationRecord
  belongs_to :a_la_uneable, polymorphic: true
end
