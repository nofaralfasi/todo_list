class List < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }
end
