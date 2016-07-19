
class MoveCommand
  def execute(robot)
    robot.set_direction_and_position(robot.direction, Direction.next_position(robot.direction, robot.position))
  end

end