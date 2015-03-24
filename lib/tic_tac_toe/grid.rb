module TicTacToe
  class Grid

    #has_many :cells
    #has_many :rows
    #has_many :columns
    #has_2    :diagonals

    attr_reader :size

    def initialize(opts = {})
      @size = opts[:size].to_i
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

    def diagonal_coordinates
      r = @size - 1
      hsh = {diagonal_one_coordinates: [],diagonal_two_coordinates: []}
      #building diagonal one
      (0...@size).each do |x|
        hsh[:diagonal_one_coordinates] << [x,x]
      end

      #building diagonal two
      (0...@size).each do |x|
        hsh[:diagonal_two_coordinates] << [x,r]
        r -=1
      end
      hsh
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

    #diagonals in the grid 2 diagonals everytime
    def diagonals
      [
        Diagonal.new(position: 0,cells: diagonal_cells(diagonal_coordinates[:diagonal_one_coordinates])),
        Diagonal.new(position: 1,cells: diagonal_cells(diagonal_coordinates[:diagonal_two_coordinates]))
      ]
    end

    #Collecting cells whihc belongs to diagonal
    def diagonal_cells(koordinates)
      cells.select do |cell|
        koordinates.include?([cell.coordinate.x,cell.coordinate.y])
      end
    end

    def open_positions
      cells.select {|cell| cell.available?}
    end

    def occupied_positions
      cells.select {|cell| cell.occupied?}
    end


    def visualize
      ap "        *** Current board ***          "
      aa = rows.collect do |row|
        row.cells.collect(&:value).join("  ")
      end
      ap aa
      ap "****************************************"
    end
  end
end
