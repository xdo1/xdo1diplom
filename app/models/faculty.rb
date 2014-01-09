class Faculty < ActiveRecord::Base
  has_many :groups
  has_many :departments

  validates :short_name, :presence => true, length: { minimum: 1, maximum: 20 }
  validates :full_name, :presence => true, length: { minimum: 2, maximum: 600 }
  validates :numer, :presence => true, length: { minimum: 2, maximum: 600 }
end
