require_relative "../piece"
require_relative "./modules/slideable"

class Rook < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end

    def move_dirs
        self.horizontal
    end

    def symbol
        @color == "white" ? "♜" : "♖"
    end
end