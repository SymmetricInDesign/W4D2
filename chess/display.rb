require "colorize"
require_relative "cursor"
require_relative "board"

class Display

    attr_reader :cursor
    attr_writer :selected
    attr_accessor :message

    def initialize(board)
        @cursor = Cursor.new([0,0],board)
        @board = board
        @selected = false
        @message = ""
    end

    def render
        system "clear"
        puts @message
        @message = ""
        color = @selected ? :green : :blue
        puts "  #{(0..7).to_a.join(" ")}"
        @board.grid.each_with_index do |row, index|
            str = "#{index}"
            row.each_with_index do |piece, j|
                str += " #{@cursor.cursor_pos == [index,j] ? piece.symbol.colorize(:background => color) : piece.symbol}"
            end
            puts str
        end
        puts "================="
    end

    def toggle_selected
        self.selected = false if @selected
        self.selected = true if !@selected
    end

end