
# Read commands and execute on robot
# stop read command after read a QuitCommand
class RobotController
  def initialize(command_reader)
    @command_reader = command_reader
  end

  def execute(robot)
    while true
      command = @command_reader.next_command

      if command.is_a? QuitCommand
        return robot
      end

      command.execute(robot)
    end
  end
end