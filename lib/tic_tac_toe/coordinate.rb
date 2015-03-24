module TicTacToe

  class Coordinate

    attr_reader :x,:y
    def initialize(opts = {})
      @x = opts[:x]
      @y = opts[:y]
    end
  end
end
