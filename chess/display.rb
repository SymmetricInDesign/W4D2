require "colorize"
require_relative "cursor"
require_relative "board"

class Display

    attr_reader :cursor

    def initialize(board)
        @cursor = Cursor.new([0,0],board)
        @board = board
    end

    def render
        system "clear"
        puts "  #{(0..7).to_a.join(" ")}"
        @board.grid.each_with_index do |row, index|
            str = "#{index}"
            row.each_with_index do |piece, j|
                str += " #{@cursor.cursor_pos == [index,j] ? piece.symbol.colorize(:background => :blue) : piece.symbol}"
            end
            puts str
        end
        puts "================="
    end

    

end


board = Board.new
game1 = Display.new(board)
game1.render

while true
    game1.cursor.get_input
    game1.render
end