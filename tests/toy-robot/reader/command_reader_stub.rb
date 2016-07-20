
class CommandReaderStub

  def initialize(*commands)
    @commands = commands
    @current_command_position = -1
  end

  def next_command()
    @current_command_position += 1
    if @current_command_position >= @commands.size
      return QuitCommand.new
    end

    @commands[@current_command_position]
  end
end