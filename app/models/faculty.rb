class Faculty < ActiveRecord::Base
  has_many :groups
  has_many :departments

  validates :short_name, :presence => true, length: { minimum: 1, maximum: 20 }
  validates :full_name, :presence => true, length: { minimum: 2, maximum: 200 }
  validates :numer, :presence => true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999999999 }
end
