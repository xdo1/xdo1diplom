class AddSubject < ActiveRecord::Migration
  def change
    create_table :subjcts do |t|
      t.string :name
      t.string :short_name

      t.timestamps
    end
  end
end
