class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.references :gym, index: true
      t.boolean :active
      t.string :name
      t.string :raiting

      t.timestamps
    end
  end
end
