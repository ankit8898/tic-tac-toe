
require_relative "../lib/tic_tac_toe"

game = TicTacToe::Game.new

game.build_grid_info




def player_message(game)
  game.open_positions.collect {|cell| "[#{cell.coordinate.x},#{cell.coordinate.y}]"}.each_with_index do |obj,i|
    ap "#{i+1}: #{obj}"
  end
end

player_message(game)
#ap game.open_positions



#a = [" A b c", " B D W", " E W R"]

#puts a.join("\n")



loop do


end
