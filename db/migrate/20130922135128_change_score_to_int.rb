class ChangeScoreToInt < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :cul_top_rope_score, :integer, "USING CAST(cul_top_rope_score AS integer)", 1
      t.change :cul_bouldering_score, :integer, "USING CAST(cul_bouldering_score AS integer)", 1

      t.change :cul_bouldering_score, :decimal, precision: 7, scale: 2
      t.change :cul_bouldering_score, :decimal, precision: 3, scale: 0
      t.change :avg_top_rope_score, :decimal, precision: 4, scale: 2
      t.change :avg_bouldering_score, :decimal, precision: 4, scale: 2
      t.change :grade, :decimal, precision: 4, scale: 2
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
