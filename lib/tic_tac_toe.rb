require 'pry'
class TicTacToe

  def initialize (board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [     #constant
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
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(index_string)
  index = index_string.to_i
  index = index-1
  index
  #@board[index-1] = index
end

def move(index, token="X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == " "
    false
  else
    true
  end
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  #if index < @board.length
  #  if position_taken?(index) == false
  #    true
  #  end
  #end
end

def turn
  puts "Please enter 1-9:"
  index_string = gets.chomp
  index = input_to_index(index_string)
  token = current_player
  if valid_move?(index)
    move(index, token)
  else
    #while valid_move?(input_to_index(index_string)) == false do
    puts "try again"
    turn #ask for input
    #end #while
  end #if
  display_board
end

def turn_count
  counter = 0
  @board.each do |position|
    if position != " "
      counter +=1
    end
  end #do
  counter
end

def won?

end

def current_player
  turn_count % 2 == 0? "X": "O"
end

end
