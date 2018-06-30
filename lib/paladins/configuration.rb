module Paladins
  class Configuration
    attr_accessor :api_url, :dev_id, :auth_key, :response_format

    def initialize
      @api_url     = "http://api.paladins.com/paladinsapi.svc"
      @dev_id      = ENV['PALADINS_DEV_ID'] || nil
      @auth_key    = ENV['PALADINS_AUTH_KEY'] || nil
      @response_format = 'Json'
    end
  end
end
