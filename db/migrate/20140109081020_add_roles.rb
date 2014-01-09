class AddRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string   :role_name
      t.integer  :role_number
      t.timestamps
    end

  end
end
