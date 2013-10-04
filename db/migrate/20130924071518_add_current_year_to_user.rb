class AddCurrentYearToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_year, :string
  end
end
