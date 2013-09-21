class User < ActiveRecord::Base
  has_many :tags
  has_many :memberships
  has_many :gyms, through: :memberships

  def to_s
    "#{last_name}, #{first_name} (#{id})"
  end

  def self.create_from_facebook(auth)
    create! do |user|
      user.facebook_id = auth.uid
      user.first_name = auth.extra_.raw_info_.first_name
      user.last_name = auth.extra_.raw_info_.last_name
      user.email = auth.extra_.raw_info_.email
    end
  end
end
