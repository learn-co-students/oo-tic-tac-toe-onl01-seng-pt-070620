class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

# [0,1,2]
# [3,4,5]
# [6,7,8]

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,4,6],
    [2,5,8],
    [3,4,5],
    [6,7,8],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(board, token = "X")
    @board[board] = token
  end

  def position_taken?(index)
    if !(@board[index] == " " || @board[index].nil?)  # Check for empty spaces
      true
    else
      false
    end
  end

  def valid_move?(move)

    if move.between?(0, 8) && !position_taken?(move) #(@board[move] == " " || @board[move].nil?)
      true
    else
      false
    end
  end

  def turn_count
    @board.count { |x| x == "X" || x == "O"}
  end

  def current_player
    if turn_count.even?
       "X"
    else
       "O"
    end
  end

end
