class ChangeSomeFiels < ActiveRecord::Migration
  def change
    change_column :discipline_groups, :hours_by_plan, :integer, default: 0
    change_column :discipline_groups, :total_hours_in_semester, :integer, default: 0
    change_column :discipline_groups, :number_z_e, :integer, default: 0
    change_column :discipline_groups, :number_s_r, :integer, default: 0
    change_column :discipline_groups, :number_a_r, :integer, default: 0
    change_column :discipline_groups, :lek_hours_total, :integer, default: 0
    change_column :discipline_groups, :lek_work_hours_per_week, :integer, default: 0
    change_column :discipline_groups, :lek_study_hours_per_week, :integer, default: 0
    change_column :discipline_groups, :lab_hours_total, :integer, default: 0
    change_column :discipline_groups, :lab_work_hours_per_week, :integer, default: 0
    change_column :discipline_groups, :lab_study_hours_per_week, :integer, default: 0
    change_column :discipline_groups, :sem_hours_total, :integer, default: 0
    change_column :discipline_groups, :sem_work_hours_per_week, :integer, default: 0
    change_column :discipline_groups, :sem_study_hours_per_week, :integer, default: 0
  end
end
