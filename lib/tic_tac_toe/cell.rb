module TicTacToe
  class Cell

    #belong_to :grid

    attr_reader :value,:coordinate

    def initialize(opts)
      @value    = opts[:value] || nil #[" ","X"].sample
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
