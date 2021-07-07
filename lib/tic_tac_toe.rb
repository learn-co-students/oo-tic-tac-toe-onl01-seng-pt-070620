require 'pry'

class TicTacToe 
  
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
    ]
  
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    x = input.to_i 
    index = x-=1
    index
  end
  
  def move(index,token = "X")
   #@board[0] = "X"
   #@board[4] = "O"
   @board[index] = token 
  
  end
  
  def position_taken?(position)
   if @board[position] != " "
      true 
    else 
      false 
   end 
  end
  
  def valid_move?(position)
   if @board[position] == " " && position.between?(0,8)
     true 
   else 
     false 
   end
  end
  
  def turn_count
    @board.count {|i| i != " "}
  end 
  
  def current_player 
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end 
  end
  
  def turn 
    puts "Please choose 1-9"
    input = gets.strip
    index = input_to_index(input)
    user = current_player 
    if valid_move?(index)
      move(index,user)
      display_board
    else 
     turn
   end 
 end 
  
  def won? 
    WIN_COMBINATIONS.detect do |results|
      if @board[results[0]] == "X" && @board[results[1]] == "X" && @board[results[2]] == "X"
        results
        elsif @board[results[0]] == "O" && @board[results[1]] == "O" && @board[results[2]] == "O"
        results
      else
        false
      end
    end
  end
  
  def full?
    @board.all? {|i| i != " "}
  end
  
  def draw?
    if full? && !won? 
      true 
    else if won? && !full?
      false 
    else
      nil 
      end
    end
  end
  
  def over?
    if won? || draw?
      true 
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
      puts  "Cat's Game!"
  end
end  
  
  
  
end