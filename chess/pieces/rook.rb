require_relative "../piece"

class Rook < Piece
    
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