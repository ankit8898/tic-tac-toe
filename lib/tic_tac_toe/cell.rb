module TicTacToe
  class Cell

    #belong_to :grid

    attr_reader :value,:coordinate

    def initialize(opts)
      @value    = opts[:value]
      @coordinate = opts[:coordinate]
    end

  end
end
