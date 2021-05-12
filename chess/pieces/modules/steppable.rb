require "byebug"
module Steppable

    def moves
        x,y = self.pos

        possible_moves = []
        move_diffs = self.move_diffs
        (0..7).each do |i|
            new_x = x + move_diffs[i][0]
            new_y = y + move_diffs[i][1]
            # debugger
            next unless new_x.between?(0,7) && new_y.between?(0,7)
            next if self.board[[new_x,new_y]].color == self.color
            possible_moves << [new_x,new_y] if new_x.between?(0,7) && new_y.between?(0,7)
        end
        possible_moves
    end 
    
    
end