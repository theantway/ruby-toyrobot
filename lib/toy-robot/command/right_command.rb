
class RightCommand
  def execute(robot)
    robot.set_direction_and_position(Direction.right(robot.direction), robot.position)
  end
end