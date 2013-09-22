class User < ActiveRecord::Base
  has_many :tags
  has_many :memberships
  has_many :climbs
  has_many :gyms, through: :memberships
  has_many :climbs

  def to_s
    "#{last_name}, #{first_name} (#{id})"
  end

  def name
    "#{first_name} #{last_name}"
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

  def calculate_total_height_climbed!
    height = climbs.inject(0) { |total, climb| total + climb.problem.height.to_i } 
    update_attributes total_height: height
    height
  end

  def calculate_cumulative_score!(field)
    total = climbs.inject(0) { |sum, climb| sum + ( climb.problem.send("#{field}?") ? climb.problem.grade.to_i : 0 ) }
    update_attributes "cul_#{field}_score" => total
    total 
  end

  def calculate_average_score!(field)
    arr = climbs.keep_if { |climb| climb.problem.send("#{field}?") }

    score = 0 if arr.empty?

    score ||= arr.inject(0) { |sum, climb| sum + ( climb.problem.send("#{field}?") ? climb.problem.grade.to_i : 0 ) }.to_f / arr.size if arr

    update_attributes "avg_#{field}_score" => score

    score
  end
end
