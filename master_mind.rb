# Module with variables
module Variables
  attr_reader :r, :b, :g, :y, :o, :pk

    def initialize(r, b, g, y, o, pk)
    # 6 colors for code
    @r = r # red
    @b = b # blue
    @g = g # green
    @y = y # yellow
    @o = o # orange
    @pk = pk # pink
  
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
  
      @new_array = []
      randomizer = Random.new
      code_pegs.map do |value| 
        @new_array.push(code_pegs[randomizer.rand(6)])
      end
    end  

  # Check player's guess and provide feedback
  def check 
    
    @black_keys = 0
    @white_keys = 0
    # A correct entry (in placement and color)
    i = 0 
    while i < computer_array.length do
      if player_array[i] == computer_array[i]
        @black_keys += 1 
        player_array[i] = "A"
        computer_array[i] = "B"
      end
      i += 1 
    end
    
    # A correct color-only
    j = 0 
    while j < computer_array.length do 
    
      k = 0 
      while k < player_array.length do 
        
        if ( ( computer_array[j] == player_array[k] ) &&
             ( j != k ) ) then 
            
          @white_keys += 1 
          player_array[k] = "Z"
          computer_array[j] = "Y"
        end
        k += 1
      end
    
      j += 1
    end

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


        