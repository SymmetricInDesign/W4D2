require_relative "../piece"
require "./steppable"

class Knight
    ROW = [1, 1,-1,-1, 2, 2,-2,-2]
    COL = [2,-2, 2,-2, 1,-1, 1,-1]

    def initialize(color, board, pos)
        super
    end

    def valid_moves
        arr = []

        arr << move if super(move)
    end

    def symbol
        :K
    end
    
end