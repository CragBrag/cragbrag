class Gym < ActiveRecord::Base
  has_many :problems
  has_many :memberships
  has_many :users, through: :memberships

  def to_s
    "#{name} (#{id})"
  end
end
