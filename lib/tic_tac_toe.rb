require 'pry'
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [0,3,6],
    [2,4,6]
  
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
  
  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == nil
      return false
    else
      true
    end
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
    puts "Choose a position between 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    
    if valid_move?(index)
      @board[index] = current_player
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |winner|
      if @board[winner[0]] == @board[winner[1]] &&
         @board[winner[1]] == @board[winner[2]]
          (@board[winner[0]] == "X" || @board[winner[0]] == "O")
    end
  end
end

 
  def full?
    @board.all? {|token| token == "X" || token == "O"}
  end
 
  def draw?
    if !won? && full?
      return true
    else
      false
    end
  end
 
  def over?
    draw? || won?
   
  end
 
  def winner
    if won?
      winner = won?
      @board[winner[0]] 
    else
      nil
    end
  end
    
 
  def play
    until over?
    turn
     end
    
    if won? {|winner| winner == "X" || winner == "O"}
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    draw?
    end
  end
end

      
      

  