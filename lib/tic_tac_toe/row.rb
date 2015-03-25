#Row
#
# Row are present in grids

module TicTacToe
  class Row

    attr_reader :position,:cells

    def initialize(opts = {})
      @position = opts[:position]
      @cells    = opts[:cells]
    end
  end
end
