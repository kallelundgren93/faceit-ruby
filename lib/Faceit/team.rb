module Faceit
  class Team

    attr_reader :team_id
    attr_reader :name
    attr_reader :game
    attr_reader :verified
    attr_reader :faceit_url
    attr_reader :chat_room_id
    attr_reader :avatar

    def initialize(attributes = {})
      @id = attributes['team_id']
      @name = attributes['name']
      @verified = attributes['verified']
      @avatar = attributes['avatar']
      @game = attributes['game']
      @faceit_url = attributes['faceit_url']
      @chat_room_id = attributes['chat_room_id']
    end
  end
end
