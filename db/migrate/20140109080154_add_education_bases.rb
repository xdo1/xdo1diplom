class AddEducationBases < ActiveRecord::Migration
  def change
    create_table :education_bases do |t|
      t.string   :name
      t.timestamps
    end
  end
end
