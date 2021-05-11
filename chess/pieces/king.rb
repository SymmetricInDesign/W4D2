require_relative "../piece"
require "./steppable"

class King < Piece
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
        :King
    end
end