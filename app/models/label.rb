class Label < ApplicationRecord
  has_many :tasks

  validates :title, presence: true, length: { minimum: 2 }
end
