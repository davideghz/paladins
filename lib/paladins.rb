require "paladins/configuration"
require "paladins/version"
require "paladins/player"
require "paladins/session"

module Paladins
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
