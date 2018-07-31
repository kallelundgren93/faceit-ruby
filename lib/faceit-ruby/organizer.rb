module Faceit
  class Organizer

    attr_reader :organizer_id
    attr_reader :name
    attr_reader :partner
    attr_reader :avatar
    attr_reader :games
    attr_reader :countries
    attr_reader :active
    attr_reader :regions

    def initialize(attributes = {})
      @id = attributes['organizer_id']
      @name = attributes['name']
      @partner = attributes['partner']
      @avatar = attributes['avatar']
      @games = attributes['games']
      @countries = attributes['countries']
      @active = attributes['active']
      @regions = attributes['regions']
    end
  end
end
