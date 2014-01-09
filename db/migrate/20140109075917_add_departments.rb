class AddDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string   :name
      t.integer  :faculty_id
      t.string   :numer
      t.timestamps
    end
  end
end
