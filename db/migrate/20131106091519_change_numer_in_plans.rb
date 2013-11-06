class ChangeNumerInPlans < ActiveRecord::Migration
  def change
    change_column :plans, :numer, :string
  end
end
