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
        @black_king_pos = [0,4]
        @white_king_pos = [7,4]

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

    def move_piece(player_color, start_pos, end_pos)
        # debugger
        piece = self[start_pos]
        raise WrongPieceError.new if piece.color != player_color 
        if piece.moves.include?(end_pos)
            if piece.valid_moves.include?(end_pos)
                if piece.is_a?(King)
                    piece.color == "black" ? @black_king_pos = end_pos : @white_king_pos = end_pos
                end
                puts "moved from #{start_pos} to #{end_pos}"
                piece.pos = end_pos 
                self[end_pos] = piece
                self[start_pos] = NullPiece.instance
            else
                raise CheckError.new
            end
        else
            raise MoveError.new
        end
    end

    def move_piece!(player_color, start_pos, end_pos)
        piece = self[start_pos]
        raise WrongPieceError.new if piece.color != player_color 
        if piece.moves.include?(end_pos)
            if piece.is_a?(King)
                piece.color == "black" ? @black_king_pos = end_pos : @white_king_pos = end_pos
            end
            # puts "moved from #{start_pos} to #{end_pos}"
            piece.pos = end_pos 
            self[end_pos] = piece
            self[start_pos] = NullPiece.instance
        end
    end

    def [](pos)
        x,y=pos
        @grid[x][y]
    end

    def []=(pos, value)
        x,y=pos
        @grid[x][y] = value
    end

    def in_check?(color)
        king_pos = color == "black" ? @black_king_pos : @white_king_pos
        @grid.each do |row|
            row.each do |piece|
                next if piece.color == color || piece.color == "gray"
                return true if piece.moves.include?(king_pos)
            end
        end
        false
    end

    def checkmate?(color)
        @grid.each do |row|
            row.each do |piece|
                if piece.color == color
                    return false if !piece.valid_moves.empty?
                end
            end
        end
        true
    end

    def deep_dup
        duped_board = self.dup
        new_grid = []
        @grid.each do |row|
            subbarr = []
            row.each do |piece|
                if !piece.is_a?(NullPiece)
                    new_piece = piece.dup
                    new_piece.board = duped_board
                    subbarr << new_piece
                else
                    subbarr << piece
                end
            end
            new_grid << subbarr
        end


        duped_board.grid = new_grid
        duped_board
    end

end

class CheckError < StandardError
end

class MoveError < StandardError
end

class WrongPieceError < StandardError
end

p board = Board.new
p board2 = board.deep_dup

p board2[[1,5]].valid_moves   

# puts "============================="

# p board.deep_dup[[0,0]].object_id


# queen = Queen.new("white", board, [3,3])


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