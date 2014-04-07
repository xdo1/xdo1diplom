class Group < ActiveRecord::Base
  belongs_to :study_year
  belongs_to :department
  belongs_to :faculty
  belongs_to :speciality
  has_one :study_period
  has_one :study_process_graphic
  #has_one :education_form
  has_and_belongs_to_many :plans

  validates :name, :presence => true, length: { minimum: 2, maximum: 200 }
  validates :faculty_id, :presence => true
  validates :department_id, :presence => true
  validates :course, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }
  validates :term, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  validates :payment_format, :presence => true
  validates :education_form, :presence => true
  validates :gos3, :presence => true
  validates :speciality_id, :presence => true
  validates :in_weight, :presence => true
  validates :students, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  attr_reader :plan_tokens

  def plan_tokens=(ids)
    self.plan_ids=ids.split(',')
  end

end
