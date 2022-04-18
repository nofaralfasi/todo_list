class Task < ApplicationRecord
  belongs_to :list
  belongs_to :labels, optional: true

  validates :title, presence: true, length: { minimum: 2 }
end
