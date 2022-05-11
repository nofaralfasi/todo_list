class Task < ApplicationRecord
  belongs_to :list
  belongs_to :label, optional: true

  validates :title, presence: true, length: { minimum: 2 }

  validate :future_datetime?

  def print_due_date
    due_date.strftime('%d/%m/%Y %I:%M %p')
  end

  private

  def future_datetime?
    return unless due_date.to_i < Time.now.to_i

    errors.add(:due_date, 'cannot be in the past!')
  end
end
