require "faraday"
require "faraday_middleware"

require "faceit/response"
require "faceit/api_error"
require "faceit/player"
require "faceit/game"

module Faceit
  class Client
    API_ENDPOINT = "https://open.faceit.com/data/v4".freeze

    def initialize(api_key: nil)
      if api_key.nil?
        raise "An APIKEY is required to create client"
      elsif !!api_key
        warn(%{WARNING: Apikey is required.})
      end

      headers = {
        "User-Agent": "face-it-ruby client #{Faceit::VERSION}"
      }
      unless api_key.nil?
        api_key = api_key.gsub(/^Bearer /, "")
        headers["Authorization"] = "Bearer #{api_key}"
      end

      @conn = Faraday.new(API_ENDPOINT, { headers: headers }) do |faraday|
        faraday.request :json
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_player(player_id)
      get("players/#{player_id}", {})
    end

    def get_all_games
      get('games', {})
    end

    private
      def get(resource, params)
        http_res = @conn.get(resource, params)
        finish(http_res)
      end

      def post(resource, params)
        http_res = @conn.post(resource, params)
        finish(http_res)
      end

      def put(resource, params)
        http_res = @conn.put(resource, params)
        finish(http_res)
      end

      def finish(http_res)
        unless http_res.success?
          raise ApiError.new(http_res.status, http_res.body)
        end

        http_res.body
      end
  end
end
