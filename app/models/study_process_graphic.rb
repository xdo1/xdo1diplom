class StudyProcessGraphic < ActiveRecord::Base
  has_many :study_periods
  belongs_to :qualification
  belongs_to :study_year
  validates  :semester_beginning, :presence => true
  validates  :semester_end, :presence => true
  validates  :zach_session_beginning, :presence => true
  validates  :zach_session_end, :presence => true
  validates  :exam_session_beginning, :presence => true
  validates  :exam_session_end, :presence => true
  validates  :vacation_beginning, :presence => true
  validates  :vacation_end, :presence => true
  validates  :gos_exam_beginning, :presence => true
  validates  :gos_exam_end, :presence => true
  validates  :vkr_beginning, :presence => true
  validates  :vkr_end, :presence => true
  validates  :vkr_type, :presence => true
  validates  :name, length: { maximum: 300 }
  validates  :qualification_id, :presence => true
  validates  :weeks_in_semester, :presence => true
end
