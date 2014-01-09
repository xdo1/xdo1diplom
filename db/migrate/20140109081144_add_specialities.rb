class AddSpecialities < ActiveRecord::Migration
  def change
    create_table :specialities do |t|
      t.string  :speciality_numer
      t.boolean  :gos3
      t.string   :qualification
      t.string   :direction_name
      t.string   :direction_numer
      t.string   :speciality_name
      t.timestamps
    end
  end
end
