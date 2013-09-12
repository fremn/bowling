class BowlingGame
  attr_accessor :rolls
  
  def initialize
    @rolls = []
  end
  # Record a roll in the game.
  # pins = The Integer number of pins knocked down in this roll. 
  def roll(pins)
    @rolls.push(pins)
  end
  
  # sums all rolls
  def score
    @rolls.reduce(:+)
  end
end
