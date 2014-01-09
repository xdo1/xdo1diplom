class AddSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string   :name
      t.string   :short_name
      t.timestamps
    end
  end
end
