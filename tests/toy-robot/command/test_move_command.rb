require "test/unit"
require "require_all"

require_rel "../../../lib/toy-robot/domain"
require_rel "../../../lib/toy-robot/command"

class TestMoveCommand < Test::Unit::TestCase

  def test_execute_command
    robot = Robot.new
    table_top = TableTop.new(5, 5)

    robot.table_top = table_top
    robot.set_direction_and_position(Direction.NORTH, Position.new(0, 0))
    MoveCommand.new.execute(robot)

    assert_equal(Direction.NORTH, robot.direction)
    assert_equal(Position.new(0, 1), robot.position)
  end

end