class Speciality < ActiveRecord::Base
  has_many :groups
  has_many :plans
  validates :speciality_name, :presence => true, length: { minimum: 2, maximum: 200 }
  validates :speciality_numer, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999999999 }
  validates :gos3, :presence => true
  validates :qualification, :presence => true
  validates :direction_name, :presence => true
  validates :direction_numer, :presence => true, numericality: { only_integer: true}
end
