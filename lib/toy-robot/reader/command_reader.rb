require "require_all"

require_rel "../domain"
require_rel "../command"

# Read commands from input stream
class CommandReader
  @@PLACE_COMMAND_LENGTH = 4

  def initialize(command_input_stream)
    @command_input_stream = command_input_stream

    @place_pattern = '\s*PLACE'
    @number_pattern = '\s*(\d+)\s*'
    @direction_pattern = '\s*(NORTH|EAST|SOUTH|WEST)\s*'
    @place_command_pattern = "\\A#{@place_pattern}\s+#{@number_pattern},#{@number_pattern},#{@direction_pattern}\\Z"

    @noop_command = NoopCommand.new

    @cached_reusable_commands = {
        'LEFT' => LeftCommand.new,
        'RIGHT' => RightCommand.new,
        'MOVE' => MoveCommand.new,
        'REPORT' => ReportCommand.new,
    }
  end

  # Read next command from input stream
  # Always not nil,
  # use NoopCommand for any invalid command
  # use QuitCommand for end of input stream
  def next_command
    command_line = strip(@command_input_stream.readline.chomp).upcase

    cached_command(command_line) || parse_place_command(command_line) || @noop_command
  rescue EOFError
    QuitCommand.new
  end

  private def cached_command(command_line)
    @cached_reusable_commands[command_line]
  end

  private def parse_place_command(command_line)
    _, x, y, direction = command_line.match(@place_command_pattern).to_a

    if _ != nil
      return PlaceCommand.new(x.to_i, y.to_i, Direction.from_string(direction))
    end

    if command_line.length > 0
      puts "Ignored invalid command #{command_line}"
    end

    nil
  end

  private def strip(command_line)
    command_line.strip! || command_line
  end
end