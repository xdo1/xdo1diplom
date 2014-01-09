class AddPlansStudyYears < ActiveRecord::Migration
  def change
    create_table :plans_study_years do |t|
      t.integer  :study_year_id
      t.integer  :plan_id
      t.timestamps
    end
  end
end
