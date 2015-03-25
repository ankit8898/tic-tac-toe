module TicTacToe

  #Human is a type of player
  class Helper

    def self.message_banner(message)
      ap "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      ap "@                                                           @"
      ap "@                                                           @"
      ap "@         ------------- #{message} --------------           @"
      ap "@                                                           @"
      ap "@                                                           @"
      ap "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    end


    def self.announce_winner(winner)
      ap "@@@@@@@@@@@@@@@@@@@**************@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      ap "@                                                           @"
      ap "@                                                           @"
      ap "@                 #{winner}          Won!!!!!!!             @"
      ap "@                                                           @"
      ap "@                                                           @"
      ap "@@@@@@@@@@@@@@@@@@***************@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    end
  end
end
