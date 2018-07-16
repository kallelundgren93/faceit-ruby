module Faceit
  class PlayerMatch
    attr_reader :match_id
    attr_reader :game_id
    attr_reader :match_type
    attr_reader :game_mode
    attr_reader :game_type
    attr_reader :best_of
    attr_reader :played
    attr_reader :max_players
    attr_reader :teams_size
    attr_reader :teams
    attr_reader :faction1
    attr_reader :team_id
    attr_reader :nickname
    attr_reader :avatar
    attr_reader :type
    attr_reader :players
    attr_reader :faceit_url
    attr_reader :playing_players
    attr_reader :competition_id
    attr_reader :competition_name
    attr_reader :competition_type
    attr_reader :organizer_id
    attr_reader :status
    attr_reader :started_at
    attr_reader :finished_at

    def initialize(attributes = {})
      @match_id = attributes['match_id']
      @game_id = attributes['game_id']
      @match_type = attributes['match_type']
      @game_mode = attributes['game_mode']
      @best_of = attributes['best_of']
      @played = attributes['played']
      @max_players = attributes['max_players']
      @teams_size = attributes['teams_size']
      @faction1 = attributes['faction1']
      @faction1_id = attributes['faction1']['team_id']
      @faction1_nickname = attributes['faction1']['nickname']
      @faction1_avatar = attributes['faction1']['avatar']
      @faction1_type = attributes['faction1']['type']
      @faction1_players = attributes['faction1']['players']
      @faction2 = attributes['faction2']
      @faction2_id = attributes['faction2']['team_id']
      @faction2_nickname = attributes['faction2']['nickname']
      @faction2_avatar = attributes['faction2']['avatar']
      @faction2_type = attributes['faction2']['type']
      @faction2_players = attributes['faction2']['players']
      @playing_players = attributes['playing_players']
      @competition_id = attributes['competition_id']
      @competition_name = attributes['competition_name']
      @competition_type = attributes['competition_type']
      @organizer_id = attributes['organizer_id']
      @status = attributes['status']
      @started_at = attributes['started_at']
      @finished_at = attributes['finished_at']
      @faceit_url = attributes['faceit_url']
    end
  end
end
