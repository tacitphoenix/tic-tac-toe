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

  def test_valid_winner_row
    assert TicTacToe.winner("  oxxxo  ")
  end

  def test_valid_winner_col
    assert TicTacToe.winner("xo  xo  x  ")
  end

  def test_valid_winner_dia
    assert TicTacToe.winner("x oox   x")
  end

  def test_invalid_winner
    refute TicTacToe.winner("ox  o xox")
  end

  def test_win_move
    assert_equal TicTacToe.win(" oxxo    "), " oxxo  o "
  end

  def test_block_move
    assert_equal TicTacToe.block(" xoox    "), " xoox  o "
  end

  def test_center_move
    assert_equal TicTacToe.center("         "), "    o    "
  end

  def test_empty_corner_move
    assert_equal TicTacToe.empty_corner("         "), "o        "
  end

  def test_empty_side_move
    assert_equal TicTacToe.empty_side("         "), " o       "
  end

  def test_play
    assert_equal TicTacToe.play("         "), "    o    "
  end
end