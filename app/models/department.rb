class Department < ActiveRecord::Base
  has_many :groups
  belongs_to :faculty

  validates :name, :presence => true, length: { minimum: 2, maximum: 200 }
  validates :faculty_id, :presence => true
  validates :numer, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999999999 }
end
