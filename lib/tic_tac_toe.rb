class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
    
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1 
  end
  
  def move(index, letter)
    @board[index] = letter
  end
  
  def position_taken?(input)
    @board[input] == "X" || @board[input] == "O"
  end
  
  def valid_move?(input)
    input.between?(0,8) &&
    if @board[input] == "X" || @board[input] == "O"
      false 
    else
      true 
    end
  end 
  
  def turn_count
    turns = 0 
    @board.each do |space|
      if space == "X" || space == "O"
    turns += 1 
        end
      end 
      turns
  end
  
  
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please select a number bewteen 1-9"
    input = gets.chomp
    index = input_to_index(input)
    player = current_player
    if valid_move? index 
      move(index, player)
      display_board
    else
      turn
    end
  end

  def won?
   WIN_COMBINATIONS.any? do |win_combo|
     if position_taken?(win_combo[0]) && @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]]
       return win_combo
    end
    end
 end

  def full?
    @board.all?{|full| full != " "}
  end
  
  def draw?
    if !won? && full?
      true
    end 
  end
  
  def over? 
    won? || full? || draw?
  end
  
  def winner 
    WIN_COMBINATIONS.detect do |combo| 
          if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
            return "X"
          elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            return "O"
          else 
            nil
          end
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




