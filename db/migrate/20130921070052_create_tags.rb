class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :user, index: true
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end
