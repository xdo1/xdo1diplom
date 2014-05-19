class DisciplineGroup < ActiveRecord::Base
  belongs_to :department
  has_one :group
  belongs_to :subject
  has_many :lessons
  validates :subject_id, presence: true
  validates :total_hours_in_semester, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  after_save :create_lesson



  def create_lesson
    self.lessons.each do |les|
      les.delete
    end
    if self.lek_study_hours_per_week
      Lesson.create(lesson_type: 'лек', hours: self.lek_study_hours_per_week, subject_id: self.subject_id, discipline_group_id: self.id)
    end
    if self.lab_study_hours_per_week
      Lesson.create(lesson_type: 'лаб', hours: self.lab_study_hours_per_week, subject_id: self.subject_id, discipline_group_id: self.id)
    end
    if self.sem_study_hours_per_week
      Lesson.create(lesson_type: 'сем', hours: self.sem_study_hours_per_week, subject_id: self.subject_id, discipline_group_id: self.id)
    end
    if self.report_type == 'экз'
      Lesson.create(lesson_type: 'экз', hours: 1, subject_id: self.subject_id, discipline_group_id: self.id)
      Lesson.create(lesson_type: 'конс', hours: 1, subject_id: self.subject_id, discipline_group_id: self.id)
    elsif self.report_type == 'зач'
      Lesson.create(lesson_type: 'зач', hours: 1, subject_id: self.subject_id, discipline_group_id: self.id)
    end
  end
end