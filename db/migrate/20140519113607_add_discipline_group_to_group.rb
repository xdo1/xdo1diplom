class AddDisciplineGroupToGroup < ActiveRecord::Migration
  def change
    add_column :discipline_groups, :group_id, :integer
  end
end
