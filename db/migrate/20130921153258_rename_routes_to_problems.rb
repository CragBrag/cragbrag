class RenameRoutesToProblems < ActiveRecord::Migration
  def change
    rename_table :problems, :problems
  end
end
