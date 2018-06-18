require 'faraday'
require 'json'
require 'digest'

module Paladins
  class Session
    def self.ping
      # /ping[ResponseFormat]

      response = Faraday.get("#{Paladins.configuration.api_url}/pingJson")
      attributes = JSON.parse(response.body)
    end

    def self.createsession
      # /createsession[ResponseFormat]/{developerId}/{signature}/{timestamp}

      date_time = Time.now.utc.strftime("%Y%m%d%H%M%S")
      url = "#{Paladins.configuration.api_url}/createsessionJson/#{Paladins.configuration.dev_id}/#{get_signature('createsession', date_time)}/#{date_time}"
      response = Faraday.get(url)
      attributes = JSON.parse(response.body)
    end

    def self.testsession(session_id)
      # /testsession[ResponseFormat]/{developerId}/{signature}/{session}/{timestamp}

      date_time = Time.now.utc.strftime("%Y%m%d%H%M%S")
      url = "#{Paladins.configuration.api_url}/testsessionJson/#{Paladins.configuration.dev_id}/#{get_signature('testsession', date_time)}/#{session_id}/#{date_time}"
      response = Faraday.get(url)
      attributes = JSON.parse(response.body)
    end

    def self.gethirezserverstatus(session_id)
      # /gethirezserverstatus[ResponseFormat]/{developerId}/{signature}/{session}/{timestamp}

      date_time = Time.now.utc.strftime("%Y%m%d%H%M%S")
      url = "#{Paladins.configuration.api_url}/gethirezserverstatusJson/#{Paladins.configuration.dev_id}/#{get_signature('gethirezserverstatus', date_time)}/#{session_id}/#{date_time}"
      response = Faraday.get(url)
      attributes = JSON.parse(response.body)
    end

    private

    def self.get_signature(method_name, date_time)
      raise ArgumentError.new('Missing dev_id or auth_key') if ( Paladins.configuration.dev_id.to_s.empty? || Paladins.configuration.auth_key.to_s.empty? )
      Digest::MD5.hexdigest(Paladins.configuration.dev_id + method_name + Paladins.configuration.auth_key + date_time);
    end
  end
end
