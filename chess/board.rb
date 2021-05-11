require_relative "piece"
require_relative "./pieces/knight"

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
        if piece.valid_moves.include?(end_pos)
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

# board = Board.new
# # p board

# knight1 = Knight.new("black", board, [3,3])
# # knight2 = Knight.new("black", board, [6,6])

# board.add_piece(knight1, knight1.pos)
# # board.add_piece(knight2, knight2.pos)

# board.render
# puts "====================="

# board.move_piece([3,3], [5,4])

# board.render