module TicTacToe

  #has_one :grid
  class Game

    attr_accessor :human ,:computer,:grid

    def build_grid_info
      ap "Collecting information for Grid...  Size will be N * N"
      size = get_grid_size
      @grid = Grid.new(size: size) #.build
    end

    def build_human_info
      ap "Collecting information for Player..."
      name = get_name
      marker = get_marker
      @human = Human.new(name: name,marker: marker)
    end

    def build_computer_info
      ap "Collecting information for Computer ."
      marker = get_marker
      @computer = Computer.new(marker: marker)
    end

    def get_name
      ask("What's your name?  ")
    end

    def get_marker
      ask("Select a Marker from the List (@,X,*)? ")
    end

    def get_grid_size
      ask("Select a Grid size ? eg: 3",Integer) {|q| q.in = 1..105}
    end

    def open_positions
      @grid.open_positions
    end

    def formatted_open_positions
      hsh = Hash.new
      open_positions.each_with_index do |cell,i|
        hsh["#{i+1}"] = [cell.coordinate.x,cell.coordinate.y]
      end
      hsh
    end

    def winner?(player)
      grid.winner?(player)
    end

    def play(coordinate,player)
      cell = open_positions.find {|cell| cell.coordinate.x == coordinate[0] && cell.coordinate.y == coordinate[1]}
      cell.value = player.marker
    end

    def auto_play(player)
      if open_positions.count > 0
        cell = open_positions.sample
        cell.value = player.marker
      end
    end
  end
end
