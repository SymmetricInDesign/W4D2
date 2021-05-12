require_relative "pieces"
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
                # puts "moved from #{start_pos} to #{end_pos}"
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