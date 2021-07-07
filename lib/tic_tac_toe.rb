class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [ 
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8], 
    [0,4,8], [2,4,6] 
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1 
  end
  
   def move(index, token)
     @board[index] = token
  end
  
    def position_taken?(index)
      @board[index] == "X" || @board[index] == "O"
    end
  
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end
    
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
     end 
     
     def current_player
       turn_count % 2 == 0 ? "X" : "O"
     end
     
     def turn 
       puts " pick a number between 1 and 9."
      number= gets
      index = input_to_index(number)
     if valid_move?(index) == true
       move(index, current_player)
       display_board
    else turn
     end
   end

      def won?
  WIN_COMBINATIONS.detect do |winner|
    @board[winner [0]] == @board[winner[1]] &&
    @board[winner[1]] == @board[winner[2]] &&
    (@board[winner[0]] == "X" || @board[winner[0]] == "O")
    end
  end

      def full?
        @board.all? {|index| index == "O" || index == "X"}
      end
      
      def draw?
       full? && !won? 
     end
     
     def over?
      won? || draw?
     end
     
     def winner
        WIN_COMBINATIONS.detect do |results|
      if
      @board[results [0]] == "X" &&
      @board[results [1]] == "X" &&
      @board[results [2]] == "X"
      return "X"
      elsif
      @board[results [0]] == "O" &&
      @board[results [1]] == "O" &&
      @board[results [2]] == "O"
    return "O"
      else
     nil
     end
    end
  end

  def play 
      turn until over?
      if won?
      puts "Congratulations #{winner}!"
  else puts "Cat's Game!"
  end
  end
end
