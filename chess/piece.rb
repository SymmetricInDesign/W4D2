class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        "p"
    end

    valid_moves(pos)
        
    end

end