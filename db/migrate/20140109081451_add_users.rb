class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :username,         null: false
      t.string   :first_name
      t.string   :second_name
      t.string   :last_name
      t.string   :crypted_password
      t.string   :salt
      t.integer  :current_role
      t.string   :current_year
      t.timestamps
    end
  end
end
