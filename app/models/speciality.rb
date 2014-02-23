class Speciality < ActiveRecord::Base
  has_many :groups
  has_many :plans
  #validates :speciality_name, length: { minimum: 2, maximum: 600 }
  #validates :speciality_numer, length: { minimum: 2, maximum: 600 }
  #validates :qualification, :presence => true
  #validates :direction_name, :presence => true, length: { minimum: 2, maximum: 600 }
  #validates :direction_numer, :presence => true, length: { minimum: 2, maximum: 600 }
end
