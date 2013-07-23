class CreateGamesAndPlayers < ActiveRecord::Migration
  def change
    create_table :game_players do |t|
      t.integer :players
      t.integer :games
    end
  end
end
