# A command does nothing, instead of return a nil object, return an object of NoopCommand reduces extra nil checks
class NoopCommand
  def execute(robot)
  end
end