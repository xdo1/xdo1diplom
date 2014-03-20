class StudyProcessGraphic < ActiveRecord::Base
  has_many :study_periods
  belongs_to :qualification
  belongs_to :study_year

end
