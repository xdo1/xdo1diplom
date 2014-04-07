class AddGroupid < ActiveRecord::Migration
  def change
    add_column :study_process_graphics, :group_id, :integer
  end
end
