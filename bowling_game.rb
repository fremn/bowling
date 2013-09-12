class BowlingGame
  attr_accessor :rolls
  
  def initialize
    @rolls = []
    @total_score  = 0
    @current_roll = 0
  end
  # Record a roll in the game.
  # pins = The Integer number of pins knocked down in this roll. 
  def roll(pins)
    @rolls.push(pins)
  end
  
  # adds the 2 rolls of the frame to the total score
  def score
    while @current_roll < @rolls.size - 1 #roll tracker automatically runs when a roll occurs?
      init_roll
      # accounts for strikes, spares, and normal scores
      if strike?
        score_strike
      elsif spare?
        score_spare 
      else
        score_norm
      end      
    end

    return @total_score
  end

  private #methods for this class only
  # Returns true if the current roll is a strike, false otherwise.
  
  #initialize the @roll and @next_roll to be based on current roll
  def init_roll
    @roll       = @rolls[@current_roll]
    @next_roll  = @rolls[@current_roll + 1] 
  end

  # adds two rolls to the total score
  def score_norm
    @total_score += @roll + @next_roll
    @current_roll += 2
  end

   # returns true if previous 2 rolls == 10
  def spare?
    @roll + @next_roll == 10
  end

  # to be used in conjunction with strike? 
  # adds 10 + the number of pins 2 rolls from now
  def score_spare 
    @total_score += 10 + @rolls[@current_roll + 2]
    @current_roll += 2
  end
   
  # returns true if @roll is 10
  def strike?
    @roll == 10
  end

  # used in conjunction with strike? adds 10 + the next frame 
  # (effectively multiplying the next 2 rolls by 2 but not really) 
  def score_strike
    @total_score += 10 + @next_roll + @rolls[@current_roll + 2]
    @current_roll += 1
  end
end
