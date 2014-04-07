class AddSomeFields < ActiveRecord::Migration
  def change
    add_column :specialities, :spec_id, :integer
    add_column :qualifications, :qualification_numer, :integer
  end
end
