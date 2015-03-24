module TicTacToe
  class Grid

    #has_many :cells
    #has_many :rows
    #has_many :columns
    #has_2    :diagonals

    attr_reader :size  #,:columns

    def initialize(opts = {})
      @size    = opts[:size]
    end

    #Setting up the coordinates for grid
    def coordinates
      arr = []
      (0...@size).each do |row|
        (0...@size).each do |column|
          arr << Coordinate.new(x: row,y: column)
        end
      end
      arr
    end

    #build cells via coordinates
    def cells
      coordinates.collect {|coordinate| Cell.new(coordinate: coordinate)}
    end

    #Rows in the grid
    def rows
      r = []
      cells.group_by {|cell| cell.coordinate.x}.each_pair do |key,value|
        r << Row.new(position: key,cells: value)
      end
      r
    end

    #columns in the grid
    def columns
      c = []
      cells.group_by {|cell| cell.coordinate.y}.each_pair do |key,value|
        c << Column.new(position: key, cells: value)
      end
      c
    end

    #diagonals in the grid
    def diagonals
    end
  end
end
