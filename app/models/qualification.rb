class Qualification < ActiveRecord::Base
  validates :name, :presence => true, length: { minimum: 2, maximum: 200 }
end
