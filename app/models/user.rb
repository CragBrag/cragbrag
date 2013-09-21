class User < ActiveRecord::Base
  has_many :tags
  has_many :memberships
  has_many :climbs
  has_many :gyms, through: :memberships
  has_many :climbs
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

  def photo_url(height=50, width=50)
    "https://graph.facebook.com/#{facebook_id}/picture?width=#{width}&height=#{height}"
  end


end
