class CreateStudyPeriods < ActiveRecord::Migration
  def change
    create_table :study_periods do |t|
      t.integer :group_id
      t.integer :study_process_graphic_id
      t.string :name

      t.timestamps
    end
  end
end
