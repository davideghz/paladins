require 'faraday'
require 'json'
require 'digest'
require 'monitor'

module Paladins
  class Client
    # include MonitorMixin

    @@session = { id: nil, updated_at: nil }

    attr_accessor :api_url, :dev_id, :auth_key, :response_format

    def initialize(configuration)
      @api_url     = configuration.api_url
      @dev_id      = configuration.dev_id
      @auth_key    = configuration.auth_key
      @response_format = configuration.response_format
    end

    def get_signature(method_name, time_now)
      raise ArgumentError.new('Missing dev_id or auth_key') if ( @dev_id.to_s.empty? || @auth_key.to_s.empty? )
      Digest::MD5.hexdigest(@dev_id + method_name + @auth_key + time_now);
    end

    def create_session
      # /createsession[ResponseFormat]/{developerId}/{signature}/{timestamp}
      response = Faraday.get(url(method: 'createsession', session: false))
      @@session[:updated_at] = Time.now
      @@session[:id] = JSON.parse(response.body).dig('session_id')
    end

    def test_session
      # /testsession[ResponseFormat]/{developerId}/{signature}/{session}/{timestamp}
      time_now = Paladins::Utils.time_now
      response = Faraday.get("#{@api_url}/testsessionJson/#{@dev_id}/#{get_signature('testsession', time_now)}/#{@@session[:id]}/#{time_now}")
      attributes = JSON.parse(response.body)
    end

    def session_expired?
      self.synchronize do
        if Time.now - @@session[:updated_at] > 60*12
          @@session[:updated_at] = Time.now
          true
        else
          false
        end
      end
    end

    def get_or_create_session
      ( @@session[:id].nil? || session_expired? ) ? create_session : @@session[:id]
    end

    def ping
      # /ping[ResponseFormat]
      response = Faraday.get("#{@api_url}/pingJson")
      attributes = JSON.parse(response.body)
    end

    def get_hirez_server_status
      # /gethirezserverstatus[ResponseFormat]/{developerId}/{signature}/{session}/{timestamp}
      response = Faraday.get(url(method: 'gethirezserverstatus', session: true))
      attributes = JSON.parse(response.body)
    end

    def get_champion_ranks(player_name)
      # /getchampionranks[ResponseFormat]/{developerId}/{signature}/{session}/{timestamp}/{player}
      response = Faraday.get(url(method: 'getchampionranks', session: true) + "/#{player_name}")
      attributes = JSON.parse(response.body)
    end

    def get_player(player_name)
      # /getplayer[ResponseFormat]/{developerId}/{signature}/{session}/{timestamp}/{player}
      response = Faraday.get(url(method: 'getplayer', session: true) + "/#{player_name}")
      attributes = JSON.parse(response.body)
    end

    def url(method:, session: false)
      time_now = Paladins::Utils.time_now
      url = "#{@api_url}/#{method}#{@response_format}/#{@dev_id}/#{get_signature(method, time_now)}"
      url += "/#{get_or_create_session}" if session
      url += "/#{time_now}"

      url
    end
  end
end
