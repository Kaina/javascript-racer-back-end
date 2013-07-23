class Game < ActiveRecord::Base
  has_and_belongs_to_many :players
  validate :check_for_two_players

  private

  def check_for_two_players
    
  end
end
