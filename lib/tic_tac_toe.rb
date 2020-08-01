class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|player| player == "X" || player == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def input_to_index(number)
    number.to_i - 1 
  end
  
  def move(position, player = "X")
    @board[position] = player
  end
  
  def position_taken?(index_i)
    ((@board[index_i] == "X") || (@board[index_i] == "O"))
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
      else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
  end

  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
    if !won? && full?
      return true
    elsif won? && !full?
      false
    end
  end
  
  def over?
    if won? || draw?
      return true
    else 
      false
    end
  end
  
  def winner 
    WIN_COMBINATIONS.detect do |results|
    if @board[results[0]] == "X" && @board[results[1]] == "X" && @board[results[2]] == "X"
      return "X"
    elsif @board[results[0]] == "O" && @board[results[1]] == "O" && @board[results[2]] == "O"
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
    elsif draw?
      puts "Cat's Game!"
    end
  end
end