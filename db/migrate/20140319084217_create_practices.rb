class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.date :beginning
      t.date :end
      t.string :name
      t.string :reporting
      t.integer :weeks
      t.integer :ze_for_gos3

      t.timestamps
    end
  end
end
