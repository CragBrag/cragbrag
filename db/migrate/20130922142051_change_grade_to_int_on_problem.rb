class ChangeGradeToIntOnProblem < ActiveRecord::Migration
  def up
    remove_column :problems, :grade

    add_column :problems, :grade, :decimal, precision: 4, scale: 2
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
