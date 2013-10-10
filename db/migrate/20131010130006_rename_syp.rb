class RenameSyp < ActiveRecord::Migration
  def change
    rename_table :study_years_plans, :plans_study_years
  end
end
