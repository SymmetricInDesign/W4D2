require_relative "piece"
require_relative "./pieces/knight"
require_relative "./pieces/rook"
require_relative "./pieces/queen"
require_relative "./pieces/king"
require_relative "./pieces/bishop"
require_relative "./pieces/nullpiece.rb"
require_relative "./pieces/pawn.rb"
class Board

    attr_accessor :grid
    def initialize()
        null_piece = NullPiece.instance
        @grid = Array.new(8){ Array.new(8, null_piece) }
        self.build_pawn_rows
        self.build_back_rows

        # self.render
    end

    def build_pawn_rows
        (0..7).each do |i|
            white_pawn = Pawn.new("white", self, [6,i])
            black_pawn = Pawn.new("black", self, [1,i])
            self.add_piece(white_pawn, white_pawn.pos)
            self.add_piece(black_pawn, black_pawn.pos)
        end
    end

    def build_back_rows
        class_names = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

        class_names.each_with_index do |class_name, i|
            self.add_piece(class_name.new("black", self, [0,i]), [0,i])
            self.add_piece(class_name.new("white", self, [7,i]), [7,i])
        end

    end


    def add_piece(piece, pos)
        self[pos] = piece
    end

    def move_piece(start_pos, end_pos)

        # debugger
        piece = self[start_pos]
        raise "no piece at position" if piece == NullPiece.instance
        if piece.moves.include?(end_pos)
            puts "moved from #{start_pos} to #{end_pos}"
            piece.pos = end_pos 
            self[end_pos] = piece
            self[start_pos] = NullPiece.instance
        end
        self.render
    end

    def [](pos)
        x,y=pos
        @grid[x][y]
    end

    def []=(pos, value)
        x,y=pos
        @grid[x][y] = value
    end

    # def render
    #     puts "  #{(0..7).to_a.join(" ")}"
    #     @grid.each_with_index do |row, index|
    #         str = "#{index}"
    #         row.each do |piece|
    #             str += " #{piece.symbol}"
    #         end
    #         puts str
    #     end
    #     puts "================="
    # end

end

board = Board.new
# p board

queen = Queen.new("white", board, [3,3])
# knight1 = Knight.new("black", board, [6,6])
# knight2 = Knight.new("white", board, [6,7])

# board.add_piece(queen, queen.pos)
# board.add_piece(knight1, knight1.pos)
# board.add_piece(knight2, knight2.pos)
# p queen.moves

# board.move_piece([1,3], [3,3])
# board.move_piece([6,7], [5,7])
# board.move_piece([0,2], [5,7])
# board.move_piece([5,7], [0,2])

# board.move_piece([0,3], [2,3])
# board.move_piece([7,7], [2,7])

# board.move_piece([1,6], [2,7])
# board.move_piece([0,4], [1,3])


# board.render