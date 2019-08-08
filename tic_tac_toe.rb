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

    def self.play(str)
        if valid_board(str)
            # win
            new_str = win(str)
            return new_str if new_str != str

            #block
            new_str = block(str)
            return new_str if new_str != str

            #center
            new_str = center(str)
            return new_str if new_str != str

            #empty_corner
            new_str = empty_corner(str)
            return new_str if new_str != str

            #empty_side
            new_str = empty_side(str)
            return new_str if new_str != str
        else
            false
        end
    end

    # strategies

    def self.win(str)
        board = to_board(str)
        all_paths(str).each_with_index do |row, n|
            chk_str = row.join("")
            if !chk_str.match(/x/) && chk_str.count("o") == 2
                i = row.index(" ")
                co_od = mapper[n][i]
                board[co_od[0]][co_od[1]] = "o"
            end
        end
        to_string(board)
    end

    def self.block(str)
        board = to_board(str)
        all_paths(str).each_with_index do |row, n|
            chk_str = row.join("")
            if !chk_str.match(/o/) && chk_str.count("x") == 2
                i = row.index(" ")
                co_od = mapper[n][i]
                board[co_od[0]][co_od[1]] = "o"
            end
        end
        to_string(board)
    end

    def self.fork(str)
        # TODO: needs to be implemented
    end

    def self.block_fork(str)
        # TODO: needs to be implemented
    end

    def self.center(str)
        board = to_board(str)
        board[1][1] = "o" if board[1][1] = " "
        to_string(board)
    end

    def self.opposite_corner(str)
        # TODO: needs to be implemented
    end

    def self.empty_corner(str)
        board = to_board(str)
        corners.each do |k,v|
            x,y = v
            board[x][y] = "o" if board[x][y] = " "
            return to_string(board)
        end
        to_string(board)
    end

    def self.empty_side(str)
        board = to_board(str)
        middle_sides.each do |k,v|
            x,y = v
            board[x][y] = "o" if board[x][y] = " "
            return to_string(board)
        end
        to_string(board)
    end

    # win conditions

    def self.winner(str)
        all_paths(str).each{|row| return true if row.uniq.size < 2}
        return false
    end

    def self.mapper
        {
            0 => [[0,0], [0,1], [0, 2]],
            1 => [[1,0], [1,1], [1, 2]],
            2 => [[2,0], [2,1], [2, 2]],
            3 => [[0,0], [1,0], [2, 0]],
            4 => [[0,1], [1,1], [2, 1]],
            5 => [[0,2], [1,2], [2, 2]],
            6 => [[0,0], [1,1], [2, 2]],
            7 => [[2,0], [1,1], [0, 2]]
        }
    end

    def self.corners
        {
            0 => [0,0],
            1 => [0,2],
            2 => [2,0],
            3 => [2,2]
        }
    end

    def self.middle_sides
        {
            0 => [0,1],
            1 => [1,0],
            2 => [1,2],
            3 => [2,1]
        }
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
