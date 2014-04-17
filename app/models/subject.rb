class Subject < ActiveRecord::Base
  has_many :discipline_groups
  validates :short_name, :presence => true, length: { minimum: 1, maximum: 35 }
  validates :name, :presence => true, length: { minimum: 2, maximum: 300 }
end
