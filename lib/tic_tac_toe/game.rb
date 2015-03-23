module TicTacToe

  #has_one :grid
  class Game

    attr_reader :human ,:computer


    def build_human_info
      name = get_name
      marker = get_marker
      @human = Human.new(name: name,marker: marker)
    end

    def build_computer_info
      marker = get_marker
      @computer = Computer.new(marker: marker)
    end

    def get_name
      name = ask
    end

    def get_marker
      marker = ask
    end

    def ask
      gets
    end
  end
end
