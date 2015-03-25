require_relative 'lib/tic_tac_toe'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task default:  :spec


desc "Play tic toe"

task :play do
  TicTacToe::Play.now!
end
