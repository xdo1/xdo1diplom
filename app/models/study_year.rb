class StudyYear < ActiveRecord::Base
  has_many :groups
  has_and_belongs_to_many :plans
  validates :years, :presence => true
end
