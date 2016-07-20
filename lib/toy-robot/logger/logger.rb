require 'logger'

class Logger
  @@logger = Logger.new($stdout)

  def self.logger
    @@logger
  end
end