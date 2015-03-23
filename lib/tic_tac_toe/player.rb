module TicTacToe
  class Player

    attr_reader :marker,:name

    def initialize(opts)
      @marker = opts[:marker]
      @name   = opts[:name]
    end

    def type
      self.class.to_s.split("::").last
    end
  end
end
