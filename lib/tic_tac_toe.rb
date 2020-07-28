require 'pry'
class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  #@winner = " "
  
  def initialize
    @board = Array.new(9," ")
    @winner = ""
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    (user_input.to_i)-1
  end
  
  def move(index,token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == " " ? false : true
  end
  
  def valid_move?(index)
     if index.between?(0,8) 
       !position_taken?(index)
     else
       false
     end
  end
  
  def turn
    puts "Please enter 1 - 9"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      #puts "Please enter 1 - 9"
      turn
    end
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      selected_board = []
      win_combination.each do |index|
        selected_board << @board[index]
      end
     
      if selected_board.uniq.length == 1 && selected_board[0] != " "
        @winner = selected_board[0]
        return win_combination
      end
    end
    return false
  end
  
  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end
  
  def draw?
    if full? && won? == false
      true
    elsif won? != false
      false
    elsif !full? && won? == false
      false
    end
  end
  
  def over?
    if won? || draw?
      true
    end
  end

  def winner
   if won? == false
     nil
   else 
    # @board[won?[0]]
    @winner
   end
  end
  
  def play
    until over? do 
      turn
    end
    if won? != false
      puts "Congratulations #{@winner}!"
    elsif draw? 
      puts "Cat's Game!"
    end
  end

end

#my_game = TicTacToe.new
#my_game.input_to_index("5")