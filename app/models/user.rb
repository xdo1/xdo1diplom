class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_and_belongs_to_many :roles

  validates :fio, :presence => true
  validates :username, :presence => true
  validates :password, presence: true, length:{minimum:5}, confirmation: true, if: proc{|user| user.new_record? || user.password.present?}
  validate :has_roles?

  private

  def has_roles?
    errors.add(:base, 'Выберите хотя бы одну роль') if self.roles.blank?
  end
end
