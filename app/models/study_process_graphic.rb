class StudyProcessGraphic < ActiveRecord::Base
  has_one :study_period
  belongs_to :qualification
  belongs_to :study_year
  belongs_to :group


end
