class Problem < ActiveRecord::Base
  belongs_to :gym
  has_many :climbs

  mount_uploader :photo, PhotoUploader

  scope :top_rope, -> {where(grade_type: 'top_rope')}
  scope :bouldering, -> { where(grade_type: 'bouldering') }

  def to_s
    name + " (#{grade})"
  end

  def average_user_score
    arr = climbs.pluck(:grade).map{ |grade| grade.to_f }
    return 0 if arr.empty?
    arr.inject{ |sum, el| sum + el }.to_f / arr.size
  end

  def top_rope?
    grade_type.underscore.downcase == 'top_rope'
  end

  def bouldering?
    grade_type.underscore.downcase == 'bouldering'
  end

  def normalized_grade
    if top_rope?
      grade.to_s.split('.').last.to_i
    else
      grade
    end
  end
end
