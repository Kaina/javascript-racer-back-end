class Player < ActiveRecord::Base
  # has_and_belongs_to_many :games
  has_many :game_players
  has_many :games, through: :game_players

  validates_uniqueness_of :name
end
