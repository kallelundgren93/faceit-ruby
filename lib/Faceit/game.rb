module Faceit
  class Game
    attr_reader :game_id
    attr_reader :short_label
    attr_reader :long_label

    def initialize(attributes = {})
      @id = attributes['game_id']
      @short_label = attributes['short_label']
      @long_label = attributes['long_label']
    end
  end
end
