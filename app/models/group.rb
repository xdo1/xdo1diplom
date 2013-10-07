class Group < ActiveRecord::Base
  belongs_to :study_year
  belongs_to :department
  belongs_to :faculty
  belongs_to :speciality

  validates :name, :presence => true, length: { minimum: 2, maximum: 200 }
  validates :faculty_id, :presence => true
  validates :department_id, :presence => true
  validates :course, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }
  validates :term, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validates :payment_format, :presence => true
  validates :education_form, :presence => true
  validates :gos3, :presence => true
  validates :speciality_id, :presence => true
  validates :in_weight, :presence => true
  validates :students, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
