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

sleep 2 #simulating for a little break ;)

game.build_computer_info


ap "*********************************************"
ap "Hello, #{game.human.name}, i am #{game.computer.name}.. You will loose .. HAHAHAH"
ap "My marker is '#{game.computer.marker}'"
ap "*********************************************"

sleep 2 #simulating for a little break ;)

ap "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
ap "@                                                           @"
ap "@                                                           @"
ap "@         ------------- GAME STARTING --------------        @"
ap "@                                                           @"
ap "@                                                           @"
ap "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

ap game.open_positions

game.open_positions.each do

  game.grid.visualize

  sleep 1
end
