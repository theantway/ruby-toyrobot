require "test/unit"
require "require_all"

require_rel "../../../lib/toy-robot/domain"
require_rel "../../../lib/toy-robot/command"

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

  def test_next_position
    assert_equal(Position.new(0, 1), Direction.next_position(Direction.NORTH, Position.new(0, 0)))
    assert_equal(Position.new(1, 0), Direction.next_position(Direction.EAST, Position.new(0, 0)))
    assert_equal(Position.new(0, -1), Direction.next_position(Direction.SOUTH, Position.new(0, 0)))
    assert_equal(Position.new(-1, 0), Direction.next_position(Direction.WEST, Position.new(0, 0)))
  end

end