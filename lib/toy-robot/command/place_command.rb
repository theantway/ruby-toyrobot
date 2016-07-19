
class PlaceCommand
  attr_reader :x
  attr_reader :y
  attr_reader :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def execute(robot)
    robot.set_direction_and_position(direction, Position.new(x, y))
  end
end