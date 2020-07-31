require 'pry'
class TicTacToe

WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [2, 4, 6], [0, 4, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

  def initialize
    @board = Array.new(9, " ")  
  end
  
  def display_board  
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    user_input = input.to_i
    user_input - 1
  end
  
  def move(index, token)
    @board[index] = token 
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false  
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end
  
  def turn_count
     @board.count{|token| token == "X" || token == "O"}
   end
   
def won?
  WIN_COMBINATIONS.detect do |win_combination|
    @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
  end
end
   
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
   
  def full?
    @board.all? do |block|
      if block == "X" || block == "O"
        true
      else
        false
      end
    end
  end
   
  def draw?
    if self.full? && !self.won?
      true
    elsif self.won?
      false
    elsif !self.full? && !self.won?
      false
    end
  end
   
  def over?
    self.draw? || self.won?  
  end
  
  def winner
    if winning_combo = won?
      winner = @board[winning_combo.first]
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    token = current_player
    if valid_move?(index)
      move(index, token)
    else
      turn
    end
    display_board
  end
  
  def play
    until self.over?
      turn
    end
      if self.won?
        puts "Congratulations #{self.winner}!"
      elsif self.draw?
        puts "Cat's Game!"
      end
  end
  
end