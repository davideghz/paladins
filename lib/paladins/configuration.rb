module Paladins
  class Configuration
    attr_accessor :api_url, :dev_id, :auth_key

    def initialize
      @api_url = "http://api.paladins.com/paladinsapi.svc"
      @dev_id = nil
      @auth_key = nil
    end
  end
end
