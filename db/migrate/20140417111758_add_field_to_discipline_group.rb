class AddFieldToDisciplineGroup < ActiveRecord::Migration
  def change
    remove_column :discipline_groups, :departments_id, :integer
    add_column :discipline_groups, :elective, :boolean, default: false
    add_column :discipline_groups, :hours_by_plan, :integer
    add_column :discipline_groups, :total_hours_in_semester, :integer
    add_column :discipline_groups, :number_z_e, :integer
    add_column :discipline_groups, :number_s_r, :integer
    add_column :discipline_groups, :number_a_r, :integer
    add_column :discipline_groups, :lek_hours_total, :integer
    add_column :discipline_groups, :lek_work_hours_per_week, :integer
    add_column :discipline_groups, :lek_study_hours_per_week, :integer
    add_column :discipline_groups, :lab_hours_total, :integer
    add_column :discipline_groups, :lab_work_hours_per_week, :integer
    add_column :discipline_groups, :lab_study_hours_per_week, :integer
    add_column :discipline_groups, :sem_hours_total, :integer
    add_column :discipline_groups, :sem_work_hours_per_week, :integer
    add_column :discipline_groups, :sem_study_hours_per_week, :integer
    add_column :discipline_groups, :ends, :boolean, default: false
    add_column :discipline_groups, :report_type, :string
    add_column :discipline_groups, :note, :string
    add_column :discipline_groups, :department_id, :integer
    add_column :discipline_groups, :subject_id, :integer
  end
end
