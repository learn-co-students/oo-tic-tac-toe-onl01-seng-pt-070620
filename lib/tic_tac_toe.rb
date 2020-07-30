require 'pry'

class TicTacToe 
  def initialize(board = nil)
    @board= board || Array.new(9, " ")
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
  
  def display_board 
    puts "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "___________"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "___________"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(string) 
    string.to_i-1
  end 
  
  def move (index, token = "X")
    @board[index]= token
  end 
  
  def position_taken?(index)
     @board[index] != " "
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count {|position|position == "X" || position == "O"}
  end
  
  def current_player 
    if turn_count % 2 == 0 
      "X"
    else 
      "O" 
    end 
  end
  
  
  def turn
    puts "Enter a position number:"
    input = gets.chomp
    index= input_to_index(input)
    player= current_player
    if valid_move?(index)
      move(index,player)
        display_board
    else
      turn 
    end 
  end 
  
  def won?
    WIN_COMBINATIONS.find do |winner| 
     @board[winner[0]] == @board[winner[1]] &&  @board[winner[0]] == @board[winner[2]] && position_taken?(winner[1])
    end 
  end
  
  def full?
   @board.all? { |element | element != " "}
  end

  def draw? 
    full?  && !won? 
  end  

  def over?
    won? || draw?
  end 
  
  def winner
    if combo = won? 
      @board[combo[0]]
    end
  end
  
  def play 
    while !over?
      turn
    end 
    if won?
      puts "Congratulations #{winner}!" 
    else draw?
      puts "Cat's Game!" 
    end 
  end 
   
  
end 