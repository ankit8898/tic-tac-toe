module TicTacToe

  #Type of player
  class Computer < Player

    def initialize(opts = {})
      super
      @name =  "Ninja" #just a fake name for computer
    end
  end
end
