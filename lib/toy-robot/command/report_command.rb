require_relative '../domain/robot'

class ReportCommand
  def execute(robot)
    if robot.is_placed_on_table_top
      position = robot.position
      direction = Direction.to_string robot.direction
      puts "#{position.x},#{position.y},#{direction}"
    end
  end
end