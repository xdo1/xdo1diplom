class AddGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string   :name
      t.integer  :faculty_id
      t.integer  :department_id
      t.integer  :course
      t.integer  :term
      t.boolean  :payment_format
      t.string   :education_form
      t.boolean  :gos3
      t.integer  :speciality_id
      t.integer  :students
      t.boolean  :in_weight
      t.string   :study_year_id
      t.timestamps
    end
  end
end
