require 'faraday'
require 'json'
require 'digest'

module Paladins
  class Utils
    def self.time_now
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    end
  end
end
