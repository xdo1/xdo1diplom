class AddQualification < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :name

      t.timestamps
    end
  end
end
