class AddHeightToRoute < ActiveRecord::Migration
  def change
  	add_column :problems, :height, :integer
  end
end
