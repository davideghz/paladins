require "paladins/version"
require "paladins/configuration"
require "paladins/client"
require "paladins/utils"

module Paladins
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Paladins::Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  # def self.configure(&block)
  #   c = self.configuration
  #   block.call(c)
  # end

  def self.gethirezserverstatus
    client = Paladins::Client.new(configuration)
    client.get_hirez_server_status
  end

  def self.ping
    client = Paladins::Client.new(configuration)
    client.ping
  end

  def self.getchampionranks(player_name)
    client = Paladins::Client.new(configuration)
    client.get_champion_ranks(player_name)
  end
end
