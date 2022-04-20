class Task < ApplicationRecord
  belongs_to :list
  has_many :labels
#  TODO change back to belongs_to :label
end
