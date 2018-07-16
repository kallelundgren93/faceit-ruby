module Faceit
  class Match
    attr_reader :best_of
    attr_reader :calculate_elo
    attr_reader :chat_room_id
    attr_reader :competition_id
    attr_reader :competition_name
    attr_reader :competition_type
    attr_reader :configured_at
    attr_reader :demo_url
    attr_reader :faceit_url
    attr_reader :finished_at
    attr_reader :game
    attr_reader :match_id
    attr_reader :organizer_id
    attr_reader :region
    attr_reader :results
    attr_reader :score
    attr_reader :winner
    attr_reader :started_at
    attr_reader :status
    attr_reader :teams
    attr_reader :additionalProp1
    attr_reader :additionalProp2
    attr_reader :additionalProp3
    attr_reader :avatar
    attr_reader :faction_id
    attr_reader :leader
    attr_reader :name
    attr_reader :roster
    attr_reader :roster_v1
    attr_reader :substituted
    attr_reader :type
    attr_reader :version
    attr_reader :voting

    def initialize(attributes = {})
      @best_of = attributes['best_of']
      @calculate_elo = attributes['calculate_elo']
      @chat_room_id = attributes['chat_room_id']
      @competition_id = attributes['competition_id']
      @competition_name = attributes['competition_name']
      @competition_type = attributes['competition_type']
      @configured_at = attributes['configured_at']
      @demo_url = attributes['demo_url']
      @faceit_url = attributes['faceit_url']
      @finished_at = attributes['finished_at']
      @game = attributes['game']
      @match_id = attributes['match_id']
      @organizer_id = attributes['organizer_id']
      @region = attributes['region']
      @results = attributes['results']
      @score = attributes['results']['score']
      @winner = attributes['results']['winner']
      @started_at = attributes['started_at']
      @status = attributes['status']
      @teams = attributes['teams']
      @team_1 = attributes['teams']['additionalProp1']
      @team_2 = attributes['teams']['additionalProp2']
      @team_3 = attributes['teams']['additionalProp3']
      @version = attributes['version']
      @voting = attributes['voting']
    end
  end
end
