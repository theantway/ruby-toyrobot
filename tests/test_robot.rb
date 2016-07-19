require_relative "../lib/application.rb"

require "test/unit"
require "require_all"

require_rel "../lib/toy-robot/domain"

class TestRobot < Test::Unit::TestCase

  def test_not_placed_on_table_top_by_default
    robot = Robot.new

    assert_equal(nil, robot.direction)
    assert_equal(nil, robot.position)
    assert_equal(false, robot.is_placed_on_table_top)
  end

  def test_not_placed_on_table_top_after_set_table_top
    robot = Robot.new
    robot.tableTop = TableTop.new(5, 5)

    assert_equal(nil, robot.direction)
    assert_equal(nil, robot.position)
    assert_equal(false, robot.is_placed_on_table_top)
  end

  def test_placed_on_table_top_after_has_direction_and_position
    robot = Robot.new
    robot.tableTop = TableTop.new(5, 5)

    robot.set_direction_and_position(Direction::NORTH, Position.new(0, 0))

    assert_equal(true, robot.is_placed_on_table_top)
    assert_equal(Direction::NORTH, robot.direction)
    assert_equal(Position.new(0, 0), robot.position)
  end

  def test_prevent_fall_off_table_when_place_robot
    robot = Robot.new
    robot.tableTop = TableTop.new(5, 5)

    robot.set_direction_and_position(Direction::NORTH, Position.new(-1, 0))

    assert_equal(nil, robot.direction)
    assert_equal(nil, robot.position)
  end

end