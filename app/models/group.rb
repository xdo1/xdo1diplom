class Group < ActiveRecord::Base
  belongs_to :study_year
  belongs_to :department
  belongs_to :faculty
  belongs_to :speciality
end
