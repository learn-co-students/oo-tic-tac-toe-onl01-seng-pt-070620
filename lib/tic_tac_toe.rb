require 'pry'
class TicTacToe
  @@turns = 0
  attr_accessor :board, :winner_token
  WIN_COMBINATIONS = [[0, 1, 2], #top row across
                      [3, 4, 5], #middle row across
                      [6, 7, 8], #bottom row across
                      [0, 3, 6], 
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]]
  
  def initialize(board = nil)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
    line = "-----------"
    row1 = [@board[0], @board[1], @board[2]].join(' | ')
    row2 = [@board[3], @board[4], @board[5]].join(' | ')
    row3 = [@board[6], @board[7], @board[8]].join(' | ')
    puts " #{row1} "
    puts line
    puts " #{row2} "
    puts line
    puts " #{row3} "
  end
  
  def input_to_index(user_input)
    user_input = user_input.to_i
    user_input -= 1
    user_input
  end
  
  def move(index, player)
    @board[index] = player    
  end
  
  def position_taken?(index)
    @board[index] == " " ? false : true 
  end
  
  def valid_move?(index)
    @board[index] == " " ? true : false
  end
  
  def turn_count
    turn_num = 0
    @board.each do |b|  
      if b == 'X' || b == 'O'
        turn_num += 1
      end
    end
    turn_num
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn 
    input = input_to_index(gets)
    if input == -1
      turn
    end
    if valid_move?(input)
      @board[input] = current_player
      display_board
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win|
      # binding.pry
      if @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && @board[win[0]] != " "
        @winner_token = @board[win[0]]
        return win
      end
    end
    return false
  end
  
  def full?
    if !won?
      @board.include?(" ") ? false : true
    end
  end
  
  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end
  
  def over?
    draw? || won? ? true : false
  end
  
  def winner
    if over?
      if @winner_token == " "
        return nil
      end
      @winner_token
    end
  end
  
  def play
    turn until over?
    if over?
      if draw?
        puts "Cat's Game!"
      elsif won?
        puts "Congratulations #{@winner_token}!"
      end
    end
  end

end