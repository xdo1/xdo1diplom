class Subject < ActiveRecord::Base
  validates :short_name, :presence => true, length: { minimum: 1, maximum: 20 }
  validates :name, :presence => true, length: { minimum: 2, maximum: 200 }
end
