module Faceit
  class Response
    attr_reader :items

    def initialize(items)
      @items = items
    end
  end
end
