require_relative "toy-robot/reader/command_reader"
require_relative "toy-robot/domain/robot"
require_relative "toy-robot/domain/table_top"
require_relative "toy-robot/controller/robot_controller"

class Application

  def cli
    puts "Welcome to Toy Robot's world, please input commands to control the robot."

    commandReader = CommandReader.new($stdin)
    robot = Robot.new
    robot.tableTop =TableTop.new(5, 5)

    RobotController.new(commandReader).execute(robot)
  end
end