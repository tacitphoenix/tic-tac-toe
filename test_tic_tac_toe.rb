require "minitest/autorun"
require_relative "tic_tac_toe"

class TestTicTacToe < Minitest::Test
  def setup
    @board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    @board_string = "         "
    @valid_string =  "o x o   x"
    @invalid_string =  "bad o   x"
  end

  def test_new_board
    assert_equal @board, TicTacToe.board
  end

  def test_board_to_string_valid
    assert_equal TicTacToe.to_string(@board), @board_string
  end

  def test_board_to_string_invalid
    refute_equal TicTacToe.to_string(@board), @valid_string
  end

  def test_string_to_board
    assert_equal TicTacToe.to_board(@board_string), @board
  end

  def test_invalid_board
    refute TicTacToe.valid_board(@invalid_string)
  end

  def test_valid_turn
    assert TicTacToe.valid_turn(@valid_string)
  end

  def test_invalid_turn
    refute TicTacToe.valid_turn("o x x   x")
  end
end