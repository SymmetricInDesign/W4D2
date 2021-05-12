require_relative "../piece"
require_relative "./modules/slideable"

class Bishop < Piece
    include Slideable

    def initialize(color, board, pos)
        super
    end

    def move_dirs
        self.diag
    end

    def symbol
        @color == "white" ? "♝" : "♗"
    end
end