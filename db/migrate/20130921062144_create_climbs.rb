class CreateClimbs < ActiveRecord::Migration
  def change
    create_table :climbs do |t|
      t.references :user, index: true
      t.references :route, index: true
      t.datetime :attempted_on
      t.boolean :success
      t.string :rating
      t.text :comment

      t.timestamps
    end
  end
end
