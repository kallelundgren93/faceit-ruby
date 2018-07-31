module Faceit
  class Game
    attr_reader :game_id
    attr_reader :short_label
    attr_reader :long_label
    attr_reader :assets
    attr_reader :cover
    attr_reader :flag_img_icon
    attr_reader :flag_img_s
    attr_reader :flag_img_m
    attr_reader :flag_img_l
    attr_reader :featured_img_s
    attr_reader :featured_img_m
    attr_reader :featured_img_l
    attr_reader :landing_page
    attr_reader :platforms
    attr_reader :regions
    attr_reader :parent_game_id

    def initialize(attributes = {})
      @game_id = attributes['game_id']
      @short_label = attributes['short_label']
      @long_label = attributes['long_label']
      @cover = attributes['assets']['cover']
      @flag_img_icon = attributes['assets']['flag_img_icon']
      @flag_img_s = attributes['assets']['flag_img_s']
      @flag_img_m = attributes['assets']['flag_img_m']
      @flag_img_l = attributes['assets']['flag_img_l']
      @featured_img_s = attributes['assets']['featured_img_s']
      @featured_img_m = attributes['assets']['featured_img_m']
      @featured_img_l = attributes['assets']['featured_img_l']
      @landing_page = attributes['assets']['landing_page']
      @platforms = attributes['platforms']
      @regions = attributes['regions']
      @parent_game_id = attributes['parent_game_id']
    end
  end
end
