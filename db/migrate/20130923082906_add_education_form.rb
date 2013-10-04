class AddEducationForm < ActiveRecord::Migration
  def change
    create_table :education_forms do |t|
      t.string :name

      t.timestamps
    end
  end
end
