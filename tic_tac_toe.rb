module TicTacToe
    def self.board
        Array.new(3){Array.new(3, " ")}
    end

    def self.to_string(board)
        board.flatten.join()
    end

    def self.to_board(str)
        a = str.split("")
        [a[0..2],a[3..5],a[6..8]]
    end

    def self.valid_board(board)
    end
end
