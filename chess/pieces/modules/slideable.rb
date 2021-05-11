module Slideable
    
    DIAGNAL = [[1, 1], [-1, -1], [1, -1], [-1, 1]]
    HORIZONTAL = [[1, 0], [-1, 0], [0, 1], [0, -1]]

    def moves
        possible_moves = []

        dirs = self.move_dirs
        dirs.each do |dir|
            i,j = dir
            possible_moves += grow_unblocked_moves_in_dir(i,j)
        end
        possible_moves
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
        #[1,1][1,2][1,3]
        while true
            x+=dx
            y+=dy
            break if !x.between?(0,7) || !y.between?(0,7)
            arr << [x,y]
        end
        arr
    end

end