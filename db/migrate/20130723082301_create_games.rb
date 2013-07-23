class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game
      t.string :winner
      
      t.timestamps 
    end
  end
end
