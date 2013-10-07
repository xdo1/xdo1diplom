class StudyYear < ActiveRecord::Base
  has_many :groups
  validates :years, :presence => true
end
