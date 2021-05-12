require_relative "../piece"
require_relative "./modules/slideable.rb"

class Queen < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end


    def move_dirs
        self.diag + self.horizontal
    end

    def symbol
        @color == "white" ? "♛" : "♕"
    end

end

