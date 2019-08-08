require 'sinatra'
require_relative 'tic_tac_toe'

get '/' do
    board = params['board']
    if board
        response = TicTacToe.play(board)
        if response
            response
        else
            halt 400, 'Invalid Board'
        end
    else
        "Please submit a board"
    end
end
