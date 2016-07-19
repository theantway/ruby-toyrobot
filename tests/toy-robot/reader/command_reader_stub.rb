
class CommandReaderStub

  def initialize(*commands)
    @commands = commands
    @command_position = -1
  end

  def next_command()
    @command_position += 1
    if(@command_position >= @commands.size())
      return nil
    end

    @commands[@command_position]
  end
end