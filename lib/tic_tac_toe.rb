require "pry"
class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [0,4,8], [1,4,7], [2,4,6]]
  
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

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
  
  def move(index, player_token)
    @board[index] = player_token
  end
  
  def position_taken?(location)
    @board[location] == "X" || @board[location] == "O"
  end    
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn 
    #binding.pry
    puts "Please enter a number from 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn 
    end
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player 
    turn_count % 2 == 0?
    "X" : "O"
  end

  def won? 
    WIN_COMBINATIONS.detect{|winning_array|
      @board[winning_array[0]] == @board[winning_array[1]] &&
      @board[winning_array[1]] == @board[winning_array[2]] &&
      position_taken?(winning_array[0])}
  end

  def full?
    @board.all?{|element| element == "X" || element == "O"}
  end

  def draw?
    full? && !won?
  end 
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      @board[won?[0]]
    else 
       nil
  end  
  end
  
  def play
    while !over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif 
        draw?
          puts "Cat's Game!"
      end
    end
  end
