require "test/unit"
require "require_all"

require_rel "../../../lib/toy-robot/domain"
require_rel "../../../lib/toy-robot/command"

class TestPlaceCommand < Test::Unit::TestCase

  def test_place_robot_on_table
    robot = Robot.new
    table_top = TableTop.new(5, 5)

    robot.tableTop = table_top
    PlaceCommand.new(0, 0, Direction.NORTH).execute(robot)

    assert_equal(Direction.NORTH, robot.direction)
    assert_equal(Position.new(0, 0), robot.position)
  end

  def test_prevent_fall_off_table_when_place_robot
    robot = Robot.new

    robot.tableTop = TableTop.new(5, 5)
    PlaceCommand.new(-1, 0, Direction.NORTH).execute(robot)

    assert_equal(nil, robot.direction)
    assert_equal(nil, robot.position)
  end

end