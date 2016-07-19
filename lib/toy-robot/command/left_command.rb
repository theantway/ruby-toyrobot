
class LeftCommand
  def execute(robot)
    robot.set_direction_and_position(Direction.left(robot.direction), robot.position)
  end
end