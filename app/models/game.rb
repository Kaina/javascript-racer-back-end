class Game < ActiveRecord::Base
  # has_and_belongs_to_many :players
  has_many :game_players
  has_many :players, through: :game_players
  validate :check_for_two_players

  private

  def check_for_two_players
    if self.players.size != 2
      errors.add(:players, "can't be in the past")
    end
  end
end
