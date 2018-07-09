module Faceit
  class Response
    attr_reader :data

    def initialize(data)
      @data = data
    end
  end
end
