module TicTacToe
  class Cell

    #belong_to :grid

    attr_accessor :value,:coordinate

    def initialize(opts = {})
      @value =  opts[:value] if opts[:value]
      @coordinate = opts[:coordinate]
    end

    def available?
      value.nil?
    end

    def occupied?
      !available?
    end
  end
end
