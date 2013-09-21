class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :gym, index: true
      t.boolean :active
      t.string :name
      t.string :raiting

      t.timestamps
    end
  end
end
