require 'faraday'
require 'json'

module Paladins
  class Player
    def self.getchampionranks(player_name)
      # /getchampionranks[ResponseFormat]/{developerId}/{signature}/{session}/{timestamp}/{player}

      response = Faraday.get("#{Paladins.configuration.api_url}/getchampionranksJson/#{Paladins.configuration.dev_id}/#{get_signature('createsession', date_time)}/#{date_time}/#{player_name}")
      attributes = JSON.parse(response.body)
    end
  end
end
