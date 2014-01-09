class AddStudyYears < ActiveRecord::Migration
  def change
    create_table :study_years do |t|
      t.string   :years
      t.timestamps
    end
  end
end
