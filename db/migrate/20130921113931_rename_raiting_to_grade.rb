class RenameRaitingToGrade < ActiveRecord::Migration
  def change
    rename_column :problems, :raiting, :grade
  end
end
