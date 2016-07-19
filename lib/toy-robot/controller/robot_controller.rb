
class RobotController
  :command_reader

  def initialize(command_reader)
    @command_reader = command_reader
  end

  def execute(robot)
    while(true)
      command = @command_reader.next_command()

      if(command == nil)
        return
      end

      command.execute(robot)
    end
  end
end