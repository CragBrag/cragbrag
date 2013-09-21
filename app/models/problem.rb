class Problem < ActiveRecord::Base
  belongs_to :gym
  has_many :climbs
  #mount_uploader :photo, PhotoUploader

  scope :top_rope, -> {where(grade_type: 'top_rope')}
  scope :bouldering, -> { where(grade_type: 'bouldering') }

  def to_s
    name
  end

  def average_user_score
    arr = climbs.pluck(:grade).map{|grade| grade.to_f}
    arr.inject{ |sum, el| sum + el }.to_f / arr.size
  end

end
