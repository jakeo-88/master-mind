# Module with variables
module Variables
  attr_reader :r, :b, :g, :y, :o, :pk

    def colors(r, b, g, y, o, pk)
    # 6 colors for code
    @r = r # red
    @b = b # blue
    @g = g # green
    @y = y # yellow
    @o = o # orange
    @p = pk # pink
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
  
      @new_array = []
      randomizer = Random.new
  
      i = 0
      while i < 6 do 
        @new_array.push(code_pegs[randomizer.rand(6)])     
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
class Player
  include Variables     
    
  # Guess "code-sequence"
  def code_breaker
    @code_guess = Array.new
        
    puts "Guess the Code. Select 6 the following: #{@r}, #{@b}, #{@g}, #{@y}, #{@o}, or #{@pk}"
        
    i = 0 
    while i < 6 do
      selection = gets.chomp
          
      until ( (selection == @r) ||
              (selection == @b) ||
              (selection == @g) ||
              (selection == @y) ||
              (selection == @o) ||
              (selection == @pk) ) do
        puts "That's not a valid choice, try again!"
        selection = gets.chomp
      end
          
      @code_guess.push(selection)
      print @code_guess
      puts " "
          
      i += 1                                          
    end
        
  end

end
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


        