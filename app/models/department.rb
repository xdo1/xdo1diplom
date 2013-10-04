class Department < ActiveRecord::Base
  has_many :groups
  belongs_to :faculty
end
