module TicTacToe

  #has_one :grid
  class Game

    attr_accessor :human ,:computer,:grid

    def build_grid_info
      ap "Collecting information for Grid...  Size will be N * N"
      size = get_grid_size
      @grid = Grid.new(size: size)
    end

    def build_human_info
      ap "Collecting information for Player..."
      name = get_name
      @human = Human.new(name: name,marker: "X")
    end

    def build_computer_info
      ap "Collecting information for Computer ."
      @computer = Computer.new(marker: "O")
    end

    def get_name
      ask("What's your name?  ")
    end

    def get_grid_size
      ask("Select a Grid size Eg: 3",Integer) {|q| q.in = 2..100}
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
