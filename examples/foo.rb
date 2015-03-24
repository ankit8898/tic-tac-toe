
require_relative "../lib/tic_tac_toe"

game = TicTacToe::Game.new

game.build_grid_info



ap game.open_positions
game.grid.visualize
#ap game.open_positions



#a = [" A b c", " B D W", " E W R"]

#puts a.join("\n")
