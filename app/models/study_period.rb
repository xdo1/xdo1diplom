class StudyPeriod < ActiveRecord::Base
  belongs_to :group
  belongs_to :study_process_graphic
  belongs_to :study_year
  has_many :subjects
  has_and_belongs_to_many :subjects

  validates :name, length: { maximum: 300 }
  validates :group_id, :presence => true
  #validates :study_process_graphic_id, :presence => true

  attr_reader :subject_tokens


  def subject_tokens=(ids)
    self.subject_ids=ids.split(',')
  end
end
