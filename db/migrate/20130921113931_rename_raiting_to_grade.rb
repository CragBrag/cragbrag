class RenameRaitingToGrade < ActiveRecord::Migration
  def change
  	rename_column :routes, :raiting, :grade
  end
end
