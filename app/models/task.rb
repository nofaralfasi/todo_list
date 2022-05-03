class Task < ApplicationRecord
  belongs_to :list
  has_many :labels

  validates :title, presence: true, length: { minimum: 2 }
end
