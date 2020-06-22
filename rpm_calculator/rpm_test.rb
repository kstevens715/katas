require 'simplecov'
SimpleCov.start

require "minitest/autorun"
require_relative "rpm.rb"

class RpmTest < Minitest::Test
  def test_add
    assert_equal Rpm.convert("20 5 +"), "20+5 = 25"
  end

  def test_subtract
    assert_equal Rpm.convert("20 5 -"), "20-5 = 15"
  end

  def test_multiply
    assert_equal Rpm.convert("20 5 *"), "20*5 = 100"
  end

  def test_divide
    assert_equal Rpm.convert("20 5 /"), "20/5 = 4"
  end

  def test_two_functions
    assert_equal Rpm.convert("4 2 + 3 -"), "(4+2)-3 = 3"
  end

  def test_three_functions
    # According to the readme this is wrong, however I think it is correct.
    # They claim that it should be `((5*8)+7)*3 = 141` Which is the same value
    # but if we were doing non-communicative (like subtraction) instead of
    # multiplication they would get the wrong answer.
    assert_equal Rpm.convert("3 5 8 * 7 + *"), "3*((5*8)+7) = 141"
  end
end
