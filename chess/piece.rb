class Piece

    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        "p"
    end


    def valid_moves(pos)
        
    end


end