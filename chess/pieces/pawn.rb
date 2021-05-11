require_relative "../piece"

class Pawn < Piece
    
    

    def initialize(color, board, pos)
        super
        pos[0] == 1 ? @forward_dir = 1 : @forward_dir = -1
    end

    

    def moves
        poss_moves = []
        x,y = self.pos

        if forward_dir == 1
            if self.at_start_row?
                poss_moves << x + 2, y if self.board[[x+2,y]].color == 'gray' && self.board[[x+1,y]].color == 'gray'
            end
        end
    end

    private

    attr_reader :forward_dir

    def at_start_row?
        if @pos[0] == 1 && @forward_dir == 1
            return true
        elsif @pos[0] == 6 && @forward_dir = -1
            return true
        else
            false
        end
    end
    
end