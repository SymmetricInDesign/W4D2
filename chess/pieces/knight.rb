require_relative "../piece"
require_relative "./modules/steppable"

class Knight < Piece
    include Steppable
    ROW = [1, 1,-1,-1, 2, 2,-2,-2]
    COL = [2,-2, 2,-2, 1,-1, 1,-1]

    def initialize(color, board, pos)
        super
    end

    def valid_moves
        x,y = @pos
        moves = []
        (0..7).each do |i|
            moves << [x+ROW[i], y+COL[i]]
        end
        moves.select {|move| super(move)}
    end

    def symbol
        @color == "white" ? "♞" : "♘"
    end
    
    def move_diffs
        return [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    end


end