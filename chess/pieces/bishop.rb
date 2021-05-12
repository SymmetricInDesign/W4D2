require_relative "../piece"

class Bishop < Piece
    
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