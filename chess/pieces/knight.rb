require_relative "../piece"
require_relative "./modules/steppable"

class Knight < Piece
    include Steppable
    ROW = [1, 1,-1,-1, 2, 2,-2,-2]
    COL = [2,-2, 2,-2, 1,-1, 1,-1]

    def initialize(color, board, pos)
        super
    end


    def symbol
        @color == "white" ? "♞" : "♘"
    end
    
    def move_diffs
        return [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    end


end