class Plan < ActiveRecord::Base
  belongs_to :speciality
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :study_years
  validates :numer, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999999999 }
  validates :education_form, :presence => true
  validates :education_base, :presence => true
  validates :speciality_id, :presence => true, numericality: { only_integer: true}
  validates :profile_id, :presence => true, length: { minimum: 2, maximum: 200 }
  validates :profile_name, :presence => true, length: { minimum: 2, maximum: 200 }
end
