require "test/unit"

require_relative "../lib/application"

class TestApplication < Test::Unit::TestCase

  def test_execute_move_commands
    $stdin = StringIO.new('PLACE 0,0,NORTH
      MOVE
      REPORT')
    robot = Application.new.run

    assert_equal(Direction.NORTH, robot.direction)
    assert_equal(Position.new(0, 1), robot.position)
  end

  def test_execute_direction_commands
    $stdin = StringIO.new('PLACE 0,0,NORTH
      LEFT
      REPORT')
    robot = Application.new.run

    assert_equal(Direction.WEST, robot.direction)
    assert_equal(Position.new(0, 0), robot.position)
  end

  def test_execute_move_and_direction_commands
    $stdin = StringIO.new('PLACE 1,2,EAST
      MOVE
      MOVE
      LEFT
      MOVE
      REPORT')
    robot = Application.new.run

    assert_equal(Direction.NORTH, robot.direction)
    assert_equal(Position.new(3, 3), robot.position)
  end

end