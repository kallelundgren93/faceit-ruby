require "faraday"
require "faraday_middleware"

require "faceit/response"
require "faceit/api_error"
#require all different calls like 'require faceit/matches'

module Faceit
  class Client
    API_ENDPOINT = "https://open.faceit.com/data/v4".freeze

    def initialize(client_id: nil, access_token: nil)
      if client_id.nil? && access_token.nil?
        raise "An identifier token (client ID or bearer token) is required"
      elsif !!client_id && !!access_token
        warn(%{WARNING:
It is recommended that only one identifier token is specified.
Unpredictable behavior may follow.})
      end

      headers = {
        "User-Agent": "face-it-ruby client #{Faceit::VERSION}"
      }
      unless client_id.nil?
        headers["Client-ID"] = client_id
      end
      unless access_token.nil?
        access_token = access_token.gsub(/^Bearer /, "")
        headers["Authorization"] = "Bearer #{access_token}"
      end

      @conn = Faraday.new(API_ENDPOINT, { headers: headers }) do |faraday|
        faraday.request :json
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
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

        {
          data: http_res.body['data']
        }
      end
  end
end
