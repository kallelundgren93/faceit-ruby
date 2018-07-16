module Faceit
  class MatchStats
    attr_reader :rounds
    attr_reader :best_of
    attr_reader :competition_id
    attr_reader :game_id
    attr_reader :game_mode
    attr_reader :match_id
    attr_reader :match_round
    attr_reader :played
    attr_reader :round_stats
    attr_reader :additionalProp1
    attr_reader :additionalProp2
    attr_reader :additionalProp3
    attr_reader :teams
    attr_reader :players
    attr_reader :premade
    attr_reader :team_id
    attr_reader :team_stats


    def initialize(attributes = {})
      @rounds = attributes['rounds']
      @best_of = attributes['rounds']['best_of']
      @competition_id = attributes['rounds']['competition_id']
      @game_id = attributes['rounds']['game_id']
      @game_mode = attributes['rounds']['game_mode']
      @match_id = attributes['rounds']['match_id']
      @match_round = attributes['rounds']['match_round']
      @played = attributes['rounds']['played']
      @round_stats = attributes['rounds']['round_stats']
      @round_stats_prop_1 = attributes['rounds']['round_stats']['additionalProp1']
      @round_stats_prop_2 = attributes['rounds']['round_stats']['additionalProp2']
      @round_stats_prop_3 = attributes['rounds']['round_stats']['additionalProp3']
      @teams = attributes['rounds']['teams']
      @players = attributes['rounds']['teams']['players']
      @premade = attributes['rounds']['teams']['premade']
      @team_id = attributes['rounds']['teams']['team_id']
      @team_stats = attributes['rounds']['teams']['team_stats']
      @team_stats_prop_1 = attributes['rounds']['team_stats']['additionalProp1']
      @team_stats_prop_2 = attributes['rounds']['team_stats']['additionalProp2']
      @team_stats_prop_3 = attributes['rounds']['team_stats']['additionalProp3']
    end
  end
end
