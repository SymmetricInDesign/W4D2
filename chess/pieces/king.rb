require_relative "../piece"
require_relative "./modules/steppable"

class King < Piece
    include Steppable
    ROW = [1, 1,-1,-1, 0, 0, 1,-1]
    COL = [1,-1, 1,-1, 1,-1, 0, 0]

    def initialize(color, board, pos)
        super
    end

    def symbol
        @color == "white" ? "♚" : "♔"
    end

    def move_diffs  
        return [[1, 1], [1, -1], [-1, 1], [-1, -1], [0, 1], [0, -1], [1, 0], [-1, 0]]
    end

end