require "test/unit"
require "require_all"

require_rel "../../../lib/toy-robot/domain"
require_rel "../../../lib/toy-robot/command"

class TestLeftCommand < Test::Unit::TestCase

  def test_execute_command
    robot = Robot.new
    table_top = TableTop.new(5, 5)
    original_position = Position.new(0, 0)

    robot.tableTop = table_top
    robot.set_direction_and_position(Direction.NORTH, original_position)
    RightCommand.new.execute(robot)

    assert_equal(Direction.EAST, robot.direction)
    assert_equal(original_position, robot.position)
  end

end