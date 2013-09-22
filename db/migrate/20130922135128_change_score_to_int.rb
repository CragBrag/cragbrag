class ChangeScoreToInt < ActiveRecord::Migration
  def up
    remove_column :users, :cul_top_rope_score
    remove_column :users, :cul_bouldering_score
    remove_column :users, :avg_top_rope_score
    remove_column :users, :avg_bouldering_score
    remove_column :users, :grade

    add_column :users, :cul_bouldering_score, :decimal, precision: 7, scale: 2
    add_column :users, :cul_bouldering_score, :decimal, precision: 3, scale: 0
    add_column :users, :avg_top_rope_score, :decimal, precision: 4, scale: 2
    add_column :users, :avg_bouldering_score, :decimal, precision: 4, scale: 2
    add_column :users, :grade, :decimal, precision: 4, scale: 2
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
