require "minitest/autorun"
require_relative "tic_tac_toe"

class TestTicTacToe < Minitest::Test
  def setup
    @board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
  end

  def test_new_board
    assert_equal @board, TicTacToe.board
  end

  def test_board_to_string_valid
    assert_equal TicTacToe.to_string(@board), "         "
  end

  def test_board_to_string_not_valid
    refute_equal TicTacToe.to_string(@board), "X        "
  end

  def test_string_to_board
    assert_equal TicTacToe.to_board("         "), @board
  end
end