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

    def self.valid_board(str)
        chk_length = str.length == 9
        chk_chars = !str.match(/[^xo ]/)
        chk_turn = valid_turn(str)
        if chk_length && chk_chars && chk_turn
            true
        else
            false
        end
    end

    def self.valid_turn(str)
        xcnt = str.count("x")
        ocnt = str.count("o")
        (xcnt - ocnt).abs < 2
    end

    def self.winner(str)
        row_win(str) || col_win(str)
    end

    def self.row_win(str)
        board = to_board(str)
        board.each do |row|
            in_a_row = [row[0], row[1], row[2]]
            return true if in_a_row.uniq.size < 2
        end
        return false
    end

    def self.col_win(str)
        board = to_board(str)
        (0..2).to_a.each do |col|
            in_a_row = [board[0][col], board[1][col], board[2][col]]
            return true if in_a_row.uniq.size < 2
        end
        false
    end
end
