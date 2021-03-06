class Department < ActiveRecord::Base
  has_many :groups
  belongs_to :faculty
  has_many :discipline_groups

  validates :name, :presence => true, length: { minimum: 2, maximum: 600 }
  validates :faculty_id, :presence => true
  validates :numer, :presence => true, length: { minimum: 2, maximum: 600 }
end
