class Problem < ActiveRecord::Base
  belongs_to :gym

  mount_uploader :photo, PhotoUploader

  def to_s
    name
  end
end
