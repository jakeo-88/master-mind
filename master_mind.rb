# Module with variables
module Variables
  
  def colors
    # 6 colors for code
    @r = r # red
    @b = b # blue
    @g = g # green
    @y = y # yellow
    @o = o # orange
    @p = p # pink
  end 
  
  def keys
    # Key pegs for computer feedback
    @blk = blk #black
    @w = w #white
  end
end 
# Class for computer
class Computer
    include Variables
    
    # Select a random the "code-sequence"
    def make_code
      code_pegs = [@r, @b, @g, @y, @o, @pk]
  
      newarray = []
      randomizer = Random.new
  
      i = 0
      while i < 6 do 
        newarray.push(code_pegs[randomizer.rand(6)])     
        i += 1
      end
    end  

  # Select a random the "code-sequence"

  # Check player's guess and provide feedback

    # A correct entry (in placement and color)

    # A correct color-only

    # A cracked code
end 
# Class for player
    
    # Guess "code-sequence"

# Class for the running the game

  # Establish no. of games to play, must be an even no.

  #For each game

    # Play each game
    
      # 1. Computer makes "code"
      
      # 2. Player guesses

      # 3. Computer provides feed-back

      # 4. Repeat steps 2 and 3 until game is over

    # Ending each game

        # When computer declares code is cracked
    
        # When there are no more guesses

        # Check if there are more games

          # If there are more games to play, start another one

          # If all games are played, end the session


        