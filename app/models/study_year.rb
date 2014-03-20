class StudyYear < ActiveRecord::Base
  has_many :groups
  has_many :study_periods
  has_many :study_process_graphics
  has_and_belongs_to_many :plans
  validates :years, :presence => true
end
