require_relative "../lib/application.rb"

require "test/unit"
require "require_all"

require_rel "../lib/toy-robot/domain"
require_rel "../lib/toy-robot/command"

class TestDirection < Test::Unit::TestCase

  def test_left_direction
    assert_equal(Direction.WEST, Direction.left(Direction.NORTH))
    assert_equal(Direction.NORTH, Direction.left(Direction.EAST))
    assert_equal(Direction.EAST, Direction.left(Direction.SOUTH))
    assert_equal(Direction.SOUTH, Direction.left(Direction.WEST))
  end

  def test_right_direction
    assert_equal(Direction.EAST, Direction.right(Direction.NORTH))
    assert_equal(Direction.SOUTH, Direction.right(Direction.EAST))
    assert_equal(Direction.WEST, Direction.right(Direction.SOUTH))
    assert_equal(Direction.NORTH, Direction.right(Direction.WEST))
  end

end