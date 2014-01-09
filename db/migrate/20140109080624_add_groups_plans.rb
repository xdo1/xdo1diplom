class AddGroupsPlans < ActiveRecord::Migration
  def change
    create_table :groups_plans do |t|
      t.integer  :group_id
      t.integer  :plan_id
      t.integer  :students
      t.timestamps
    end
  end
end
