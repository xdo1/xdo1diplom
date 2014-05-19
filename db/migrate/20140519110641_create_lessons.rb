class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :type
      t.integer :hours
      t.integer :subject_id
      t.integer :discipline_group_id

      t.timestamps
    end
  end
end
