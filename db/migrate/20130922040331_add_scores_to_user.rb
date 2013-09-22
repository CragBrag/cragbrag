class AddScoresToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_height, :integer
    add_column :users, :cul_top_rope_score, :string
    add_column :users, :cul_bouldering_score, :string
    add_column :users, :avg_top_rope_score, :string
    add_column :users, :avg_bouldering_score, :string
  end
end
