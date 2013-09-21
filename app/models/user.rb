class User < ActiveRecord::Base
  has_many :memberships
  has_many :gyms, through: :memberships
end
