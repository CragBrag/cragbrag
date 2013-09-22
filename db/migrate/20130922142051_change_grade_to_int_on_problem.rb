class ChangeGradeToIntOnProblem < ActiveRecord::Migration
  def up
    change_table :problems do |t|
      t.change :grade, :decimal, precision: 4, scale: 2
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
