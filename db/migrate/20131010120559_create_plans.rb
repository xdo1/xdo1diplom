class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :numer
      t.string :education_form
      t.string :education_base
      t.string :profile_id
      t.string :profile_name
      t.boolean :filial
      t.integer :study_year_id
      t.integer :speciality_id
      t.integer :tp_id


      t.timestamps
    end

    create_table :study_years_plans do |t|
      t.integer :study_year_id
      t.integer :plan_id

      t.timestamps
    end

    create_table :groups_plans do |t|
      t.integer :group_id
      t.integer :plan_id
      t.integer :students


      t.timestamps
    end
  end
end
