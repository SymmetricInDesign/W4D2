require "colorize"
require_relative "cursor"
# require_relative "board"
class Display

    def initialize(board)
        @cursor = Cursor.new([0,0], board)
        @board = board
    end

    def render
        puts "  #{(0..7).to_a.join(" ")}"
        @board.grid.each_with_index do |row, index|
            str = "#{index}"
            row.each do |piece|
                str += " #{piece.symbol}"
            end
            puts str
        end
        puts "================="
    end
end