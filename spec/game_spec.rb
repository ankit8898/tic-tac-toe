describe TicTacToe::Game do

  subject {TicTacToe::Game.new}

  describe "Human info" do
    before do
      allow(subject).to receive(:get_name).and_return("Ankit G")
      allow(subject).to receive(:get_marker).and_return("O")
      subject.build_human_info
    end


    it "should have a human name asked" do
      expect(subject.human.name).to eq("Ankit G")
    end

    it "should have a marker asked" do
      expect(subject.human.marker).to eq("O")
    end
  end

  describe "Computer info" do

    before do
      allow(subject).to receive(:get_marker).and_return("X")
      subject.build_computer_info
    end


    it "should have the name harcoded" do
      expect(subject.computer.name).to eq("Ninja")
    end
  end

end
