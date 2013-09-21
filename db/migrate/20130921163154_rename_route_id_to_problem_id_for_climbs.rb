class RenameRouteIdToProblemIdForClimbs < ActiveRecord::Migration
  def change
    rename_column :climbs, :route_id, :problem_id
  end
end
