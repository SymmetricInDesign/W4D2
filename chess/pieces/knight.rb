require_relative "../piece"
require "./steppable"

class Knight
    

    def valid_moves
        arr = []

        arr << move if super(move)

    end
end