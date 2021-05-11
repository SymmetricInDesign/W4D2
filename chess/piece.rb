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
        x,y = pos
        if x.between?(0,7) && y.between?(0,7)
            return true
        end
        false
    end


end