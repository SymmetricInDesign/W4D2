require_relative "player"
class HumanPlayer < Player
    attr_reader :color
    def initialize(color, display)
        super
    end
    
    def make_move(board)
        positions=[]
        # p self
        @display.selected = false
        @display.render
        while true      
            pos = @display.cursor.get_input
            if pos
                positions << pos 
                @display.toggle_selected
            end
            if positions.length == 2
                break
            end
            @display.render
        end
        start_pos, end_pos = positions
        board.move_piece(@color, start_pos, end_pos)
    end
end