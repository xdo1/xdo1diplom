class StudyPeriodsSubjects < ActiveRecord::Migration
  def change
    create_table :study_periods_subjects do |t|
      t.integer :study_period_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
