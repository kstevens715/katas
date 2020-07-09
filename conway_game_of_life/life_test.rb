require 'minitest/autorun'
require_relative 'life.rb'

class LifeTest < Minitest::Test
  # def test_empty_board
  #   start = [
  #       [ 0, 0, 0],
  #       [ 0, 0, 0],
  #       [ 0, 0, 0],
  #   ]
  #
  #   next_step = start
  #
  #   assert_equal Life.new(start).next_step, next_step
  # end
  #
  # def test_one_in_middle
  #   start = [
  #       [ 0, 0, 0],
  #       [ 0, 1, 0],
  #       [ 0, 0, 0],
  #   ]
  #
  #   next_step = [
  #       [ 0, 0, 0],
  #       [ 0, 0, 0],
  #       [ 0, 0, 0],
  #   ]
  #
  #   assert_equal Life.new(start).next_step, next_step
  # end

  def test_alive_with_2_neighbor
    start = [
        [ 1, 1, 0],
        [ 0, 1, 0],
        [ 0, 0, 0],
    ]

    next_step = [
        [ 1, 1, 0],
        [ 1, 1, 0],
        [ 0, 0, 0],
    ]

    assert_equal Life.new(start).next_step, next_step
  end
end
