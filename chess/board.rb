class Board

    def initialize()
        @grid = Array.new(8){Array.new(8)}

    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def move_piece(start_pos, end_pos)

    end

    def [](pos)
        x,y=pos
        @grid[x][y]
    end

    def []=(pos, value)
        x,y=pos
        @grid[x][y] = value
    end

end