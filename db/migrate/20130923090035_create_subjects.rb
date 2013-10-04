class CreateSubjects < ActiveRecord::Migration
  def change
    drop_table :subjcts do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end
    create_table :subjects do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end
  end
end
