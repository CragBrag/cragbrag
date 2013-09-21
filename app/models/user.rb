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

  def total_height_climbed
    climbs.inject(0){|total, climb | total + climb.problem.height}
  end

  def cumulative_score
    total = 0
    climbs.map{|climb| climb.problem}.each do |problem|
      val = 0
      if problem.top_rope?
         val = problem.grade[2..problem.grade.length].to_i
      else
        val = problem.grade.to_i  
      end
      total += val
    end
    total 
  end

  def average_top_rope_score
    arr = climbs.keep_if{|climb| climb.problem.top_rope?}.map{|climb| climb.problem.grade}
    unless arr.empty?
      arr.inject{ |sum, el| sum + el }.to_f / arr.size if arr
    else
      0  
    end
  end

  def average_bouldering_score
    arr = climbs.keep_if{|climb| climb.problem.bouldering?}.map{|climb| climb.problem.grade}
    unless arr.empty?
      arr.inject{ |sum, el| sum + el }.to_f / arr.size if arr
    else
      0  
    end
  end

end
