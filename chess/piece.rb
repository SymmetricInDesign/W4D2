class Piece

    attr_accessor :pos, :board
    attr_reader :color

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        "p"
    end


    def valid_moves
        moves = self.moves
        moves.select do |move|
            duped_board = board.deep_dup
            duped_board.move_piece(self.pos, move)
            !duped_board.in_check?(self.color)
        end
    end


    def moves
        
    end

    def empty?
        false
    end

end