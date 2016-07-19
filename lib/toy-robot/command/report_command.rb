
class ReportCommand
  def execute(robot)
    position = robot.position
    direction = Direction.to_string robot.direction
    puts "#{position.x},#{position.y},#{direction}"
  end
end