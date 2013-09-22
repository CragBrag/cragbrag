class Climb < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  after_save :cache_user_stats

  def publish_to_stream
    Pusher['climbs'].trigger 'climb', self.to_json(include: [ :user, problem: { include: :gym } ])
  end

  private

  def cache_user_stats
    user.calculate_total_height_climbed!
    user.calculate_cumulative_score! :bouldering
    user.calculate_cumulative_score! :top_rope
    user.calculate_average_score! :bouldering
    user.calculate_average_score! :top_rope
  end
end
