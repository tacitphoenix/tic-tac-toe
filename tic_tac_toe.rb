module TicTacToe
    # board conversions
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

    # is the board valid
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

    # game engine

    def self.server_move(str)
        board = to_board(str)

    end

    # strategies

    def win
    end

    # win conditions
    def self.winner(str)
        all_paths(str).each{|row| return true if row.uniq.size < 2}
        return false
    end

    def self.all_paths(str)
        rows(str) + cols(str) + dias(str)
    end

    def self.cols(str)
        [].tap do |arr|
            board = to_board(str)
            (0..2).to_a.each{|col| arr << [board[0][col], board[1][col], board[2][col]]}
        end
    end

    def self.rows(str)
        [].tap do |arr|
            board = to_board(str)
            board.each{|row| arr << [row[0], row[1], row[2]]}
        end
    end

    def self.dias(str)
        board = to_board(str)
        [
            [board[0][0], board[1][1], board[2][2]],
            [board[2][0], board[1][1], board[0][2]]
        ]
    end
end
