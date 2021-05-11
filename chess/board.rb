require_relative "piece"
require_relative "./pieces/knight"
require_relative "./pieces/queen"

class Board

    def initialize()
        @grid = Array.new(8){Array.new(8)}

    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]
        raise "no piece at position" if piece == nil
        if piece.moves.include?(end_pos)
            piece.pos = end_pos 
            self[end_pos] = piece
            self[start_pos] = nil
        end
    end

    def [](pos)
        x,y=pos
        @grid[x][y]
    end

    def []=(pos, value)
        x,y=pos
        @grid[x][y] = value
    end

    def render
        @grid.each do |row|
            p row
        end
    end

end

board = Board.new
# p board

queen = Queen.new("black", board, [3,3])
# knight2 = Knight.new("black", board, [6,6])

board.add_piece(queen, queen.pos)
# board.add_piece(knight2, knight2.pos)
p queen.moves
board.render
puts "====================="

board.move_piece([3,3], [4,4])

board.render