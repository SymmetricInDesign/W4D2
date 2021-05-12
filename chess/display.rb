require "colorize"
require_relative "cursor"
require_relative "board"

class Display

    attr_reader :cursor
    attr_writer :selected

    def initialize(board)
        @cursor = Cursor.new([0,0],board)
        @board = board
        @selected = false
    end

    def render
        system "clear"
        color = @selected ? :green : :blue
        puts "  #{(0..7).to_a.join(" ")}"
        # p color
        # p @selected
        @board.grid.each_with_index do |row, index|
            str = "#{index}"
            row.each_with_index do |piece, j|
                str += " #{@cursor.cursor_pos == [index,j] ? piece.symbol.colorize(:background => color) : piece.symbol}"
            end
            puts str
        end
        puts "================="
    end

    # def display_loop  
    #     @selected = false
    #     positions = []
    #     self.render
    #     while true      
    #         pos = @cursor.get_input
    #         if pos
    #             positions << pos 
    #             self.toggle_selected
    #         end
    #         if positions.length == 2
    #             return positions
    #         end
    #         self.render
    #     end
    # end

    # def game_loop

    #     while !@board.checkmate?("black")
    #         begin
    #         start_pos, end_pos = self.display_loop
    #         @board.move_piece(start_pos, end_pos)
    #         rescue CheckError
    #             puts "Invalid move; would leave king in check"
    #             retry
    #         end
    #     end
    #     p "Game over"

    # end

    def toggle_selected
        self.selected = false if @selected
        self.selected = true if !@selected
    end

end


# board = Board.new
# game1 = Display.new(board)
# game1.render
# game1.game_loop

