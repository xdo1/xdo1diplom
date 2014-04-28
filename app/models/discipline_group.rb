class DisciplineGroup < ActiveRecord::Base
  belongs_to :department
  has_one :group
  belongs_to :subject
  validates :subject_id, presence: true
  validates :total_hours_in_semester, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
end
