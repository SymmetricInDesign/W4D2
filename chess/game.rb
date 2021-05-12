require_relative "board"
require_relative "display"
require_relative "humanplayer"
class Game

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @players = {
            "white" => HumanPlayer.new("white", @display), 
            "black" => HumanPlayer.new("black", @display)
        }
        @current_player = @players["white"]
    end

    def play
        while !@board.checkmate?(@current_player.color)
            notify_players("#{@current_player.color} to move.")
            begin
                @current_player.make_move(@board)
            rescue CheckError
                notify_players("Invalid move; would leave king in check")
                retry
            rescue MoveError
                notify_players("impossible move")
                retry
            rescue WrongPieceError
                notify_players("This is not your piece")
                retry
            end
            swap_turn
        end
        p "Game over. #{@current_player} loses!"
    end


    private
    
    def notify_players(message)
        if @display.message
            @display.message += " #{message}"
        else
            @display.message = message
        end
    end

    def swap_turn
        if @current_player == @players["white"]
            @current_player = @players["black"] 
        else
            @current_player = @players["white"]
        end
    end
end

game = Game.new
game.play