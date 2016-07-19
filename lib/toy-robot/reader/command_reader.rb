require "require_all"

require_rel "../domain"
require_rel "../command"

class CommandReader
  @@PLACE_COMMAND_SIZE = 4

  def initialize(input_stream)
    @input_stream = input_stream

    @noop_command = NoopCommand.new

    @commands = {
        'LEFT' => LeftCommand.new,
        'RIGHT' => RightCommand.new,
        'MOVE' => MoveCommand.new,
        'REPORT' => ReportCommand.new,
    }
  end

  def next_command()
    command_line = strip(@input_stream.gets).upcase
    cached_command = @commands[command_line]
    if cached_command != nil
      return cached_command
    end

    command_parts = command_line.split(/\W+/)
    if command_parts.size() != @@PLACE_COMMAND_SIZE
      puts "Ignored invalid commands #{command_line}"
      return @noop_command
    end

    if command_parts[0] == 'PLACE'
      x = command_parts[1].to_i
      y = command_parts[2].to_i
      direction = Direction.from_string(command_parts[3])

      if(direction == nil)
        puts "Ignored invalid direction #{command_line}"
        return @noop_command
      end

      return PlaceCommand.new(x, y, direction)
    end
  end

  def strip(command_line)
    if (command_line == nil)
      return ''
    end

    command_line.strip! || command_line
  end
end