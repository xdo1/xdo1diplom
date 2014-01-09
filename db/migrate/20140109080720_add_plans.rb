class AddPlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string   :numer
      t.string   :education_form
      t.string   :education_base
      t.string   :profile_id
      t.string   :profile_name
      t.boolean  :filial
      t.integer  :study_year_id
      t.integer  :speciality_id
      t.integer  :tp_id
      t.timestamps
    end

  end
end
