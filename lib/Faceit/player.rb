module Faceit
  class Player
    # ID of the player.
    attr_reader :player_id
    # nickname for player
    attr_reader :nickname
    # avatar for user
    attr_reader :avatar

    def initialize(attributes = {})
      @id = attributes['player_id']
      @nickname = attributes['nickname']
      @avatar = attributes['avatar']
    end
  end
end
