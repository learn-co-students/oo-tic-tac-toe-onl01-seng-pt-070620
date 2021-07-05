class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
 WIN_COMBINATIONS = [
   [0,1,2], 
   [3,4,5], 
   [6,7,8], 
   [0,3,6], 
   [1,4,7], 
   [2,5,8], 
   [0,4,8], 
   [6,4,2] 
   ]


  def display_board    
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"   
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "   
    puts "-----------"   
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input = input.to_i-1
  end
  
  def move (index, taken="X")
    @board[index] = taken
  end
  
  def position_taken?(index)
   @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    taken = 0
    @board.each do |i|
    if i == "X" || i == "O"
        taken += 1
    end
  end
    return taken
  end
  
  def current_player
    player = nil
    if turn_count() % 2 == 0
      player = 'X'
    else
      player = 'O'
    end
    return player
  end 

 def turn
  puts "Choose a spot between 1-9"
  spot = gets.strip
  spot = input_to_index(spot)
  if valid_move?(spot)
      move(spot, current_player)
  else
      turn
   end
    display_board
   end
  
  def won?
   WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]
    
    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]
    
    if position_1 == "X" && position_2 == "X" && position_3 == 'X'
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end 
   }
  return false 
  end 

  def full?
   turn_count == 9
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    won = ""
    if winner = won?
      won = @board[winner.first]
    end
  end

    def play
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end