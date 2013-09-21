class Problem < ActiveRecord::Base
  belongs_to :gym

  mount_uploader :photo, PhotoUploader
end
