require_relative "../piece"
require_relative "./modules/steppable"

class King < Piece
    include Steppable
    ROW = [1, 1,-1,-1, 0, 0, 1,-1]
    COL = [1,-1, 1,-1, 1,-1, 0, 0]

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
        @color == "white" ? "♚" : "♔"
    end

    def move_diffs  
        return [[1, 1], [1, -1], [-1, 1], [-1, -1], [0, 1], [0, -1], [1, 0], [-1, 0]]
    end

end