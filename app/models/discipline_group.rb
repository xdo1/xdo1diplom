class DisciplineGroup < ActiveRecord::Base
  belongs_to :department
  has_one :group
  belongs_to :subject
end
