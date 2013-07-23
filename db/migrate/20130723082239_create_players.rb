class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player
      
      t.timestamps
    end
    add_index :players, :player, unique: true
  end
end
