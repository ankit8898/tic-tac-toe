module TicTacToe
  class Cell

    #belong_to :grid

    attr_reader :value
    def initialize(opts)
      @value = opts[:value]
    end
  end
end
