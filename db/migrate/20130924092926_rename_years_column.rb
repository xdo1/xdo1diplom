class RenameYearsColumn < ActiveRecord::Migration
  def change
    rename_column :groups, :year, :study_year_id
  end
end
