class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :full_name
      t.string :short_name
      t.integer :numer

      t.timestamps
    end
  end
end
