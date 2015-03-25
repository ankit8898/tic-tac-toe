# This class is dirty, the idea for this class is just to pull the code that i had in example
# and use this class via rake task to easily get started :)

module TicTacToe

  class Play

    attr_reader :game
    def initialize
      @game = TicTacToe::Game.new
    end


    def self.now!
      obj = new
      obj.now
    end

    #this is just a container method to start, made to avoid using example/play.rb

    def now
      step_1 #get grid info

      sleep 1 #simulating for a little break ;)

      step_2 #get human info

      sleep 2 #simulating for a little break ;)

      step_3 #get computer info

      sleep 2 #simulating for a little break ;)

      TicTacToe::Helper.message_banner("Game starting")

      loop do

        computer, human = @game.computer, @game.human

        ap "#{computer.name}'s turn"

        @game.auto_play(computer) #Computer plays in Auto mode

        @game.grid.visualize

        if @game.winner?(computer)
          TicTacToe::Helper.announce_winner(computer.name)
          break
        end

        break if @game.open_positions.count == 0

        sleep 1

        ap "#{human.name}'s turn"

        break if @game.open_positions.count == 0

        ap "*** Available Positions ***"
        min = @game.formatted_open_positions.keys.min.to_i
        max = @game.formatted_open_positions.keys.max.to_i
        @game.formatted_open_positions.each_pair do |key,value|
          ap "#{key}. #{value.to_s}"
        end

        selection = ask("Select a position from above, between #{min} - #{max}",Integer) {|q| q.in = min..max}

        @game.play(game.formatted_open_positions["#{selection}"],human)

        @game.grid.visualize

        if @game.winner?(human)
          TicTacToe::Helper.announce_winner(human.name)
          break
        end

        sleep 1

        break if @game.open_positions.count == 0
      end
    end

    def step_1
      @game.build_grid_info
      ap "Initialized Grid of size: #{game.grid.size} * #{game.grid.size}"
    end

    def step_2
      @game.build_human_info
      ap "*********************************************"
      ap "Hello, #{@game.human.name}, all the best!"
      ap "Your marker is '#{game.human.marker}'"
      ap "*********************************************"
    end

    def step_3
      @game.build_computer_info
      ap "*********************************************"
      ap "Hello, #{@game.human.name}, i am #{@game.computer.name}... Get ready to lose! Hahah"
      ap "My marker is '#{@game.computer.marker}'"
      ap "*********************************************"
    end
  end
end
