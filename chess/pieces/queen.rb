require_relative "../piece"

class Queen < Piece

    def initialize(color, board, pos)
        super
    end


    def move_dirs
        self.diag + self.horizontal
    end

end