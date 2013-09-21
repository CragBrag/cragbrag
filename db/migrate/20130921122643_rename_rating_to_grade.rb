class RenameRatingToGrade < ActiveRecord::Migration
  def change
    rename_column :climbs, :rating, :grade
  end
end
