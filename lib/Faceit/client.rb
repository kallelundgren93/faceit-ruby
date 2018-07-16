require "faraday"
require "faraday_middleware"

require "faceit/response"
require "faceit/api_error"
require "faceit/player"
require "faceit/game"
require "faceit/organizer"
require "faceit/team"
require "faceit/tournament"

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

    #Players
    def get_player(player_id)
      get("players/#{player_id}", {})
    end

    def get_player_by_nickname(nickname)
      get("players?nickname=frekvenz", {})
    end

    #Games
    def get_games(game_id)
      if game_id.present?
        get("games/#{game_id}", {})
      else
        res = get("games", {})
        games = res['items'].map { |g| Game.new(g) }
        Response.new(games)
      end
    end
    #ex. client.get_games("tf2") or.
    #games = client.get_games() /returns all
    #games.items.first = 1 game

    #SEARCHES
    def search_organizers(options = {})
      res = get("search/organizers", options)

      organizers = res['items'].map { |g| Organizer.new(g) }
      Response.new(organizers)
    end
    #ex. client.search_organizers({[name: "SomeOrganizer"], [offset: "0"], [limit: "20"]})

    def search_players(options = {})
      res = get("search/players", options)

      players = res['items'].map { |g| Player.new(g) }
      Response.new(players)
    end
    #ex. client.search_players({[nickname: "SomeNickname"], [offset: "0"], [limit: "20"]})

    def search_teams(options = {})
      res = get("search/teams", options)

      teams = res['items'].map { |g| Team.new(g) }
      Response.new(teams)
    end
    #ex. client.search_teams({[nickname: "SomeTeamNickname"], [offset: "0"], [limit: "20"]})


    def search_tournaments(options = {})
      res = get("search/tournaments", options)

      tournaments = res['items'].map { |g| Tournament.new(g) }
      Response.new(tournaments)
    end
    #ex. client.search_tournaments({[name: "SomeTournament"], [offset: "0"], [limit: "20"]})

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
