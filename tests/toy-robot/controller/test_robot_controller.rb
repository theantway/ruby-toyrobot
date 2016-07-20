require "test/unit"
require "require_all"

require_rel "../../../lib/toy-robot/domain"
require_rel "../../../lib/toy-robot/command"
require_rel "../../../lib/toy-robot/controller"
require_rel "../reader"

class TestRobotController < Test::Unit::TestCase

  def test_place_robot_to_table_top
    robot = Robot.new
    robot.table_top = TableTop.new(5, 5)
    command_reader = CommandReaderStub.new(PlaceCommand.new(0, 1, Direction.NORTH))

    RobotController.new(command_reader).execute(robot)

    assert_equal(Direction.NORTH, robot.direction)
    assert_equal(Position.new(0, 1), robot.position)
  end

  def test_able_to_move_after_placed_on_tabletop
    robot = Robot.new
    robot.table_top = TableTop.new(5, 5)
    command_reader = CommandReaderStub.new(PlaceCommand.new(0, 0, Direction.NORTH), MoveCommand.new)

    RobotController.new(command_reader).execute(robot)

    assert_equal(Direction.NORTH, robot.direction)
    assert_equal(Position.new(0, 1), robot.position)
  end

  def test_able_to_turn_left
    robot = Robot.new
    robot.table_top = TableTop.new(5, 5)
    command_reader = CommandReaderStub.new(PlaceCommand.new(0, 0, Direction.NORTH), LeftCommand.new)

    RobotController.new(command_reader).execute(robot)

    assert_equal(Direction.WEST, robot.direction)
    assert_equal(Position.new(0, 0), robot.position)
  end

  def test_able_to_turn_right
    robot = Robot.new
    robot.table_top = TableTop.new(5, 5)
    command_reader = CommandReaderStub.new(PlaceCommand.new(0, 0, Direction.NORTH), RightCommand.new)

    RobotController.new(command_reader).execute(robot)

    assert_equal(Direction.EAST, robot.direction)
    assert_equal(Position.new(0, 0), robot.position)
  end

  def test_ignore_commands_before_place_to_table
    robot = Robot.new
    robot.table_top = TableTop.new(5, 5)
    command_reader = CommandReaderStub.new(MoveCommand.new, LeftCommand.new)

    RobotController.new(command_reader).execute(robot)

    assert_equal(nil, robot.direction)
    assert_equal(nil, robot.position)
    assert_equal(false, robot.is_placed_on_table_top)
  end

  def test_prevent_fall_off_the_tabletop
    robot = Robot.new
    robot.table_top = TableTop.new(5, 5)
    command_reader = CommandReaderStub.new(PlaceCommand.new(-1, 0, Direction.NORTH))

    RobotController.new(command_reader).execute(robot)

    assert_equal(nil, robot.direction)
    assert_equal(nil, robot.position)
    assert_equal(false, robot.is_placed_on_table_top)
  end

  def test_continue_execute_following_commands_after_ignored_invalid_position
    robot = Robot.new
    robot.table_top = TableTop.new(5, 5)
    command_reader = CommandReaderStub.new(PlaceCommand.new(-1, 0, Direction.NORTH), PlaceCommand.new(0, 0, Direction.NORTH))

    RobotController.new(command_reader).execute(robot)

    assert_equal(Direction.NORTH, robot.direction)
    assert_equal(Position.new(0, 0), robot.position)
  end

end