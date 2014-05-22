class DisciplineGroup < ActiveRecord::Base
  belongs_to :department
  belongs_to :group
  belongs_to :subject
  has_many :lessons
  validates :subject_id, presence: true
  validates :department_id, presence: true
  validates :hours_by_plan, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 200 }
  validates :weeks_by_plan, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 25 }
  validates :weeks_by_plan, :presence => true, numericality: { only_integer: true}
  validates :hours_by_plan           , :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 500 }
  validates :total_hours_in_semester , :presence => true, numericality: { only_integer: true}
  validates :number_z_e              , :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 25 }
  validates :number_s_r              , :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 25 }
  validates :number_a_r              , :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 25 }
  validates :lek_hours_total         , :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :lek_work_hours_per_week , :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :lek_study_hours_per_week, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :lab_hours_total         , :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :lab_work_hours_per_week , :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :lab_study_hours_per_week, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :sem_hours_total         , :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :sem_work_hours_per_week , :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :sem_study_hours_per_week, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  before_save :calc_total_hours
  after_save :create_lesson

  def calc_total_hours
    self.lek_hours_total = (self.lek_study_hours_per_week + self.lek_work_hours_per_week) * self.weeks_by_plan
    self.lab_hours_total = (self.lab_study_hours_per_week + self.lab_work_hours_per_week) * self.weeks_by_plan
    self.sem_hours_total = (self.sem_study_hours_per_week + self.sem_work_hours_per_week) * self.weeks_by_plan
    self.total_hours_in_semester = (self.lek_hours_total + self.lab_hours_total + self.sem_hours_total)
  end

  def create_lesson
    self.lessons.each do |les|
      les.delete
    end
    if self.lek_study_hours_per_week
      Lesson.create(lesson_type: 'лек', hours: (self.lek_study_hours_per_week + self.lek_work_hours_per_week), subject_id: self.subject_id, discipline_group_id: self.id)
    end
    if self.lab_study_hours_per_week
      Lesson.create(lesson_type: 'лаб', hours: (self.lab_study_hours_per_week + self.lab_study_hours_per_week), subject_id: self.subject_id, discipline_group_id: self.id)
    end
    if self.sem_study_hours_per_week
      Lesson.create(lesson_type: 'сем', hours: (self.sem_study_hours_per_week + self.sem_study_hours_per_week), subject_id: self.subject_id, discipline_group_id: self.id)
    end
    if self.report_type == 'экз'
      Lesson.create(lesson_type: 'экз', hours: 1, subject_id: self.subject_id, discipline_group_id: self.id)
      Lesson.create(lesson_type: 'конс', hours: 1, subject_id: self.subject_id, discipline_group_id: self.id)
    elsif self.report_type == 'зач'
      Lesson.create(lesson_type: 'зач', hours: 1, subject_id: self.subject_id, discipline_group_id: self.id)
    end
  end
end