class CreateDisciplineGroups < ActiveRecord::Migration
  def change
    create_table :discipline_groups do |t|
      t.string :name
      t.integer :weeks_by_plan
      t.belongs_to :departments

      t.timestamps
    end
  end
end
