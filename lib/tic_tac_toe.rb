class TicTacToe
  attr_accessor :board , :WIN_COMBINATIONS

  def initialize (board = nil)
    @board = board ||Array.new(9, " ")
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
      input.to_i-1
    end

    def move(index, token = "X")
      @board[index] = token
    end

    def position_taken?(index)
      !(@board [index] == " ")
    end

    def valid_move?(index)
      index.between?(0,8) && ! position_taken?(index)
    end

    def turn
      puts "Make Your Move Between 1-9"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end

    def turn_count
      counter = 0
      occupied_spaces = 0
      while counter < @board.size
        if position_taken?(counter)
          occupied_spaces += 1
        end
        counter += 1
      end
      occupied_spaces
    end

    def current_player
      if turn_count.odd?
        "O"
      else
        "X"
      end
    end

    def won?
    WIN_COMBINATIONS.each do|combo|
    if board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(combo[0])
    return combo
     end
   end
  return false
 end

 def full?
  turn_count == 9
 end

  def draw?
   !won? && full?
 end

 def over?
  won? || draw?
 end

 def winner
  if winning_combo = won?
  board[winning_combo.first]
  end
 end

 def play
  while !over?
    turn
  end
   if won?
    puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
    end
  end
end
