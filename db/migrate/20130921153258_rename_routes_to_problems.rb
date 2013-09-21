class RenameRoutesToProblems < ActiveRecord::Migration
  def change
    rename_table :routes, :problems
  end
end
