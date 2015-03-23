module TicTacToe
  class Grid

    #has_many :cells

    attr_reader :rows,:columns

    def initialize(opts)
      @rows   = opts[:rows]
      @columns = opts[:columns]
    end

    #Setting up the coordinates for grid
    def coordinates
      arr = []
      (0...@rows).each do |row|
        (0...@columns).each do |column|
          arr << [row,column]
        end
      end
      arr
    end

  end
end
