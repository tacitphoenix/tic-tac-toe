require 'sinatra'
require_relative 'tic_tac_toe'

get '/' do
    board = params['board']
    TicTacToe.play(board)
end
