module TicTacToe
  class Cell

    attr_reader :value
    def initialize(opts)
      @value = opts[:value]
    end
  end
end
