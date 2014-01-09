class Qualification < ActiveRecord::Base
  belongs_to :speciality
  has_one :education_base
  has_one :education_form
  validates :name, :presence => true, length: { minimum: 2, maximum: 1000 }
end
