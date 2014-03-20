class AddPeriodIdToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :practice_id, :integer
  end
end
