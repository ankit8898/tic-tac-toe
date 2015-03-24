describe TicTacToe::Game do

  subject {TicTacToe::Game.new}
  let(:grid) {TicTacToe::Grid.new(size: 2)}
  let!(:human) {TicTacToe::Human.new(name: 'Ank')}
  let(:computer) {TicTacToe::Computer.new(name: 'Son')}

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

  describe "turns" do
    before do
      allow(subject).to receive(:grid).and_return(grid)
      subject.computer = computer
      subject.human = human
    end

    it "should have max turns available per cell" do
      expect(subject.turns).to have(4).items
      expect(subject.turns[0]).to match_array([computer,human])
      expect(subject.turns[2]).to match_array([computer,human])
      expect(subject.turns[1]).to match_array([computer,human])
      expect(subject.turns[3]).to match_array([computer,human])
    end
  end

end
