require 'pry'
class TicTacToe
    WIN_COMBINATIONS = [[0,3,6],[1,4,7],[2,5,8],[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
    def initialize
        @board = Array.new(9," ")
    end
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(usersmove)
        usersmove = usersmove.to_i - 1
    end

    def move(index,token="X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        if index.between?(0,8) && @board[index] == " "
            return true
            else
                return false
        end
    end
    def turn
        puts "Pick a number 1-9"
        usersmove = gets.strip
        movecleaned = input_to_index(usersmove)
        if valid_move?(movecleaned) == true
            pick = current_player
            move(movecleaned,pick)
            display_board
        else
            turn
        end
    end

    def turn_count
        @board.count{|space| space != " "}
    end

    def current_player
        if turn_count.even? == true
            "X"
        else
            "O"
        end
    end

    def won?
       WIN_COMBINATIONS.any? do |move|
        if position_taken?(move[0]) && position_taken?(move[1]) && position_taken?(move[2])
            return move if @board[move[0]] == "X" && @board[move[1]] == "X" && @board[move[2]] == "X" or @board[move[0]] == "O" && @board[move[1]] == "O" && @board[move[2]] == "O" 
        
            end
        
       end
    end

    def full?
        @board.all? {|space| space != " "}
    end

    def draw?
        if self.full? == true && self.won? == false
            true
        else
            false
        end
      
    end
    
    def over?
        won? || draw?
        
        
    end
    def winner
        if move = won? ##result won won gets put into this variable

            @board[move[0]]
        else
            nil
        end
            ##binding.pry
          
    end
    def play
        
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
        
    end
end