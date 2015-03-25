require_relative "../lib/tic_tac_toe"

game = TicTacToe::Game.new

game.build_grid_info

ap "Initialized Grid of size: #{game.grid.size} * #{game.grid.size}"

sleep 1

game.build_human_info

ap "*********************************************"
ap "Hello, #{game.human.name}, all the best!"
ap "Remember your marker is '#{game.human.marker}'"
ap "*********************************************"

#sleep 2 #simulating for a little break ;)

game.build_computer_info


ap "*********************************************"
ap "Hello, #{game.human.name}, i am #{game.computer.name}.. You will loose .. HAHAHAH"
ap "My marker is '#{game.computer.marker}'"
ap "*********************************************"

#sleep 2 #simulating for a little break ;)

ap "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
ap "@                                                           @"
ap "@                                                           @"
ap "@         ------------- GAME STARTING --------------        @"
ap "@                                                           @"
ap "@                                                           @"
ap "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

loop do

  computer, human = game.computer, game.human
  ap "#{computer.name}'s turn"

  game.auto_play(computer)

  game.grid.visualize

  sleep 1

  ap "#{human.name}'s turn"

  ap "*** Available Positions ***"
  opts = []

  game.open_positions.collect {|cell| "[#{cell.coordinate.x},#{cell.coordinate.y}]"}.each_with_index do |obj,i|
    opts << i + 1
    ap "#{i+1}: #{obj}"
  end

  ask("Select a number from above, between #{opts.min} - #{opts.max}",Integer) {|q| q.in = opts.min..opts.max}

  game.auto_play(human)
  game.grid.visualize

  sleep 1

  break if game.open_positions.count == 0
end
