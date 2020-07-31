require 'pry'
class TicTacToe
 

  def initialize (board = nil)
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
  
  def input_to_index(string)
    string.to_i - 1 
  end
  
  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" ||  @board[index] == "O" 
  end 
    
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
   @board.count {|char| char == "X" || char == "O"}
  end
  
  def current_player
    turn_count % 2 ==0? "X":"O"
  end

  def turn
    puts "Please enter a number between 1 and 9."
    num = gets.strip 
    index = input_to_index(num)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
      turn
    end
  end


  # def won? 
  #   WIN_COMBINATIONS.detect do|winner|
  #     @board[winner[0]] == @board[winner[1]] &&
  #     @board[winner[1]] == @board[winner[2]] &&
  #   (@board[winner[0]] == "X" ||  @board[winner[0]] == "O") 
  #   end
  # end
  
  # def full?
  #   @board.all? {|occupied| occupied != " "}
  # end
  
  # def draw?
  #   !(won?) && (full?)
  # end
  
  # def over?
  #   (won?) || (full?)
  # end
  
  # def winner
  #   if winning_combo = won?
  #     @winner = @board[winning_combo.first] 
  #   end
  # end
  
  # def play
  #     until over?
  #     turn
  #   end
  #   if won?
  #     puts "Congratulations #{winner}!"
  #   draw?
  #     puts "ended in draw"
  #   end
  # end
  
end











