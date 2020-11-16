# Module with variables
module Variables
  attr_reader :r, :b, :g, :y, :o, :pk, :blk, :w, :code_pegs

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

    # An array of code-pegs
    @code_pegs = [@r, @b, @g, @y, @o, @pk]
  end
end 

# Class for player
class Player
  include Variables     
    
  # Guess "code-sequence"
  def player_code
    @code_guess = Array.new
        
    puts "Select your Code. Select 4 from the following, by entering each character individually: #{@r}, #{@b}, #{@g}, #{@y}, #{@o}, #{@pk}"
        
    i = 0 
    while i < 4 do
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
class Computer
    include Variables
    
    attr_reader :computer_guess, :com_guess

    # Select a random the "code-sequence"
    def code_maker
      @computer_guess = Array.new
      @randomizer = Random.new
      
      m = 0
      while m < 4 do 
        @computer_guess.push(@code_pegs[@randomizer.rand(4)])
        m += 1
      end
      @computer_guess
    end  

    def code_breaker(cb_options)
      @com_guess = Array.new(4)
      i = 0
      while i < 4 do
          @com_guess[i] = cb_options[-1]
          i += 1
      end
      @com_guess
    end
end 
# Class for the running the game
class Game 
  include Variables  
  
  attr_accessor :cb_options, :com_guess

  # Check player's guess and provide feedback
  def check(player, computer) 
    
    @code_breaker = player

    @computer_array = Array.new

    computer.map { |i| @computer_array.push(i) }

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

  def player_guessing  
    # Play each game
      # 1. Computer makes "code"
      computer = Computer.new("r", "b", "g", "y", "o", 
                              "pk")
      computer.code_maker                              
      # 2. Player guesses
      player = Player.new("r", "b", "g", "y", "o", 
                              "pk")
      l = 0
      while l < 12 do
          p computer.computer_guess
          self.check(player.player_code, computer.computer_guess)
          break if self.blk == 4
          l += 1
      end
      # 3. Computer provides feed-back
      # 4. Repeat steps 2 and 3 until game is over
    # Ending each game
    puts "That's game!"
  end

  def computer_guessing  
    # Play each game
      # 1. Player makes "code"
      player = Player.new("r", "b", "g", "y", "o", 
                              "pk")
      # player.player_code
      test_player = ["r", "r" , "r", "r"]

      # 2. Computer guesses
      computer = Computer.new("r", "b", "g", "y", "o", 
                              "pk")
      
        @cb_options = Array[6]
        
        a = 0
        while a < 6 do
          @cb_options[a] = @code_pegs[a]
          a += 1
        end
        
        i = 0
        while i < 12 do 
          self.check(computer.code_breaker(@cb_options), test_player)
          @cb_options.pop()
          if self.blk == 4
           break  
          else
              j = 0
              while j < 4 do
                  if computer.com_guess[j] == test_player[j]
                      # do nothing
                  elsif computer.com_guess[j] == test_player[j]
                      computer.com_guess[j] = @cb_options[-1]
                  end
                  j += 1
              end
          end
          p computer.com_guess    
          i += 1
        end                        
      # 3. Computer provides feed-back
      # 4. Repeat steps 2 and 3 until game is over
    # Ending each game
    puts "That's game!"

  end
end

class MasterMind
  include Variables
  
  def play_games  
  # For each sessons
  # Establish no. of games to play, must be an even no.
    puts "Let's play Master Mind! \n" \
         "Enter the number of games. \n" \
         "Please choose an even number."
  
    @game_no = gets.chomp.to_i

    until ( (@game_no > 0) && (@game_no.even? == true) ) do
      puts "Please select an even number." 
      @game_no = gets.chomp.to_i
    end

    n = 0
    while n < @game_no do
      puts "New game!"
      game = Game.new("r", "b", "g", "y", "o", 
      "pk")

      puts "Who is the code-maker? \n" \
           "Select: computer or player"
      player_select = gets.chomp
      until player_select == "player" || player_select == "computer" do
        puts "That's not an option. \n" \
             "Select: computer or player"
        player_select == gets.chomp
      end
      
      if player_select == "player"
        game.computer_guessing
      
      elsif player_select == "computer"
        game.player_guessing
      end

      n += 1
    end
  end
end


        