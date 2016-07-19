require "test/unit"
require "require_all"

require_rel "../../../lib/toy-robot/domain"
require_rel "../../../lib/toy-robot/command"
require_rel "../../../lib/toy-robot/reader"

class TestCommandReader < Test::Unit::TestCase
  def test_read_commands
    command_reader = CommandReader.new(StringIO.new("PLACE 1,2,NORTH\nLEFT\nRIGHT\nMOVE\nREPORT\n"))

    assert (command_reader.next_command.is_a? PlaceCommand)
    assert (command_reader.next_command.is_a? LeftCommand)
    assert (command_reader.next_command.is_a? RightCommand)
    assert (command_reader.next_command.is_a? MoveCommand)
    assert (command_reader.next_command.is_a? ReportCommand)
  end

  def test_skip_invalid_commands
    command_reader = CommandReader.new(StringIO.new("PLACE\nPLACE 1,2\nPLACE 1,2,NO_DIRECTION\nINVALID"))

    assert (command_reader.next_command.is_a? NoopCommand)
    assert (command_reader.next_command.is_a? NoopCommand)
    assert (command_reader.next_command.is_a? NoopCommand)
    assert (command_reader.next_command.is_a? NoopCommand)
  end

end