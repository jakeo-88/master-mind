# Module with variables
module Variables
  attr_reader :r, :b, :g, :y, :o, :pk, :blk, :w

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

# Class for player
class Player
  include Variables     
    
  # Guess "code-sequence"
  def code_breaker
    @code_guess = Array.new
        
    puts "Guess the Code. Select 6 the following: #{@r}, #{@b}, #{@g}, #{@y}, #{@o}, #{@pk}"
        
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
    @code_guess      
  end

end

# Class for computer
class Computer < Player
    include Variables
    
    attr_reader :computer_guess

    # Select a random the "code-sequence"
    def code_maker
      @code_pegs = [@r, @b, @g, @y, @o, @pk]
  
      @computer_guess = Array.new
      @randomizer = Random.new
      
      @code_pegs.map do |value| 
        @computer_guess.push(@code_pegs[@randomizer.rand(@code_pegs.length)])
      end
      @computer_guess
    end  

  # Check player's guess and provide feedback
  def check(player) 
    
    @code_breaker = player

    @computer_array = @computer_guess

    @blk = 0
    @w = 0

    # A correct entry (in placement and color)
    i = 0 
    while i < @computer_array.length do
      if @code_breaker[i] == @computer_array[i]
        @blk += 1 
        @code_breaker[i] = "A"
        @computer_array[i] = "B"
      end
      i += 1 
    end
    
    # A correct color-only
    j = 0 
    while j < @computer_array.length do 
    
      k = 0 
      while k < @code_breaker.length do 
        
        if ( ( @computer_array[j] == @code_breaker[k] ) &&
             ( j != k ) ) then 
            
          @w += 1 
          @code_breaker[k] = "Z"
          @computer_array[j] = "Y"
        end
        k += 1
      end
    
      j += 1
    end
    puts "Black Keys: #{@blk} \n" \
       "White Keys: #{@w}"
    # A cracked code
    puts "Congrats! You cracked the code!" if @blk == @computer_array.length
  end
end 
# Class for the running the game

  # Establish no. of games to play, must be an even no.

  #For each game

    # Play each game
    @round_no = 8
      # 1. Computer makes "code"
      computer = Computer.new("r", "b", "g", "y", "o", 
                              "pk")
      # 2. Player guesses
      player = Player.new("r", "b", "g", "y", "o", 
                              "pk")
      l = 0
      while l < 8 do
          p computer.computer_guess
          computer.check(player.code_breaker)
          break if computer.blk == 6
          l += 1
      end
      # 3. Computer provides feed-back

      # 4. Repeat steps 2 and 3 until game is over

    # Ending each game

        # When computer declares code is cracked
    
        # When there are no more guesses

        # Check if there are more games

          # If there are more games to play, start another one

          # If all games are played, end the session


        