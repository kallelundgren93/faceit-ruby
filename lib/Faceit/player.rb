module Faceit
  class Player

    attr_reader :player_id
    attr_reader :nickname
    attr_reader :avatar
    attr_reader :country
    attr_reader :games
    attr_reader :status
    attr_reader :verified

    def initialize(attributes = {})
      @player_id = attributes['player_id']
      @nickname = attributes['nickname']
      @avatar = attributes['avatar']
      @country = attributes['country']
      @games = attributes['games']
      @status = attributes['status']
      @verified = attributes['verified']
    end
  end
end
