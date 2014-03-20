class CreateStudyProcessGraphics < ActiveRecord::Migration
  def change
    create_table :study_process_graphics do |t|
      t.date :semester_beginning
      t.date :semester_end
      t.date :zach_session_beginning
      t.date :zach_session_end
      t.date :exam_session_beginning
      t.date :exam_session_end
      t.date :vacation_beginning
      t.date :vacation_end
      t.date :gos_exam_beginning
      t.date :gos_exam_end
      t.date :vkr_beginning
      t.date :vkr_end
      t.string :vkr_type
      t.string :name
      t.integer :qualification_id
      t.integer :weeks_in_semester, :default => 0

      t.timestamps
    end
  end
end
