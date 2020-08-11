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

  def turn
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    x = WIN_COMBINATIONS.find{ |combo|
    @board[combo[0]] == "X" &&
    @board[combo[1]] == "X" &&
    @board[combo[2]] == "X"}

    o = WIN_COMBINATIONS.find{ |combo|
      @board[combo[0]] == "O" &&
      @board[combo[1]] == "O" &&
      @board[combo[2]] == "O"}

    return x || o
  end

  def full?
    !@board.any?{|x| x == "" || x == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end

  def play
    @board = Array.new(9, " ")
    turn until over?
    # won? ? puts("Congrats #{winner}!") : puts("Nada!")
    puts "Would you like to play another? (Y or N)"
    gets.strip.downcase == "y" ||
    gets.strip.downcase == "yes" ?
    play : puts("Goodbye!")
  end
end
