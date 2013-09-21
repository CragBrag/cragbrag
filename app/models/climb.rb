class Climb < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  def publish_to_stream
    Pusher['climbs'].trigger 'climb', self.to_json(include: [ :user, problem: { include: :gym } ])
  end
end
