module Faceit
  class Tournament

    attr_reader :competition_id
    attr_reader :competition_type
    attr_reader :name
    attr_reader :game
    attr_reader :region
    attr_reader :organizer_id
    attr_reader :organizer_type
    attr_reader :status
    attr_reader :started_at
    attr_reader :prize_type
    attr_reader :total_prize
    attr_reader :players_joined
    attr_reader :players_checkedin
    attr_reader :slots

    def initialize(attributes = {})
      @competition_id = attributes['competition_id']
      @competition_type = attributes['competition_type']
      @name = attributes['name']
      @game = attributes['game']
      @region = attributes['region']
      @organizer_id = attributes['organizer_id']
      @organizer_type = attributes['organizer_type']
      @status = attributes['status']
      @started_at = attributes['started_at']
      @prize_type = attributes['prize_type']
      @total_prize = attributes['total_prize']
      @players_joined = attributes['players_joined']
      @players_checkedin = attributes['players_checkedin']
      @slots = attributes['slots']
    end
  end
end
