module Slideable
    
    DIAGNAL = [[1, 1], [-1, -1], [1, -1], [-1, 1]]
    HORIZONTAL = [[1, 0], [-1, 0], [0, 1], [0, -1]]

    def moves
        possible_moves = []

        dirs = self.move_dirs
        dirs.each do |dir|
            i,j = dir

        end

    end

    def diag
        return DIAGNAL
    end

    def horizontal
        return HORIZONTAL
    end

    def move_dirs

    end

    def grow_unblocked_moves_in_dir(dx,dy)
        x,y = self.pos

        arr = []
        

    end

end