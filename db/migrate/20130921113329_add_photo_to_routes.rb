class AddPhotoToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :photo, :string
  end
end
