class Lesson < ActiveRecord::Base
  belongs_to :subject
  belongs_to :discipline_group
end
