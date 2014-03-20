class AddStudyYear < ActiveRecord::Migration
  def change
    add_column :study_periods, :study_year_id, :integer
    add_column :study_process_graphics, :study_year_id, :integer
  end
end
