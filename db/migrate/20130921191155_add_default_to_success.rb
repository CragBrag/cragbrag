class AddDefaultToSuccess < ActiveRecord::Migration
  def up
    Climb.where(:success => nil).each do |climb|
      climb.update(:success=>true)
      climb.save
    end
    change_column :climbs, :success, :boolean, :default => true
  end

  def down
    change_column :climbs, :success, :boolean, :default => nil
  end
end
