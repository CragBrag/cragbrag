class AddHeightToRoute < ActiveRecord::Migration
  def change
  	add_column :routes, :height, :integer
  end
end
