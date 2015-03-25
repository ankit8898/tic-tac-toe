describe TicTacToe::Game do

  subject {TicTacToe::Game.new}
  let(:grid) {TicTacToe::Grid.new(size: 2)}
  let!(:human) {TicTacToe::Human.new(name: 'Ank')}
  let(:computer) {TicTacToe::Computer.new(name: 'Son')}
  let(:player) {TicTacToe::Human.new(name: 'Ankit',marker: 'X')}
  let(:coordinate_0_0) {TicTacToe::Coordinate.new(x: 0,y: 0)}
  let(:coordinate_0_1) {TicTacToe::Coordinate.new(x: 0,y: 1)}
  let(:coordinate_0_2) {TicTacToe::Coordinate.new(x: 0,y: 2)}
  let(:coordinate_1_0) {TicTacToe::Coordinate.new(x: 1,y: 0)}
  let(:coordinate_1_1) {TicTacToe::Coordinate.new(x: 1,y: 1)}
  let(:coordinate_1_2) {TicTacToe::Coordinate.new(x: 1,y: 2)}
  let(:coordinate_2_0) {TicTacToe::Coordinate.new(x: 2,y: 0)}
  let(:coordinate_2_1) {TicTacToe::Coordinate.new(x: 2,y: 1)}
  let(:coordinate_2_2) {TicTacToe::Coordinate.new(x: 2,y: 2)}
  let(:cell_0_0)  {TicTacToe::Cell.new(coordinate: coordinate_0_0)}
  let(:cell_0_1)  {TicTacToe::Cell.new(coordinate: coordinate_0_1)}
  let(:cell_0_2)  {TicTacToe::Cell.new(coordinate: coordinate_0_2)}
  let(:cell_1_0)  {TicTacToe::Cell.new(coordinate: coordinate_1_0)}
  let(:cell_1_1)  {TicTacToe::Cell.new(coordinate: coordinate_1_1)}
  let(:cell_1_2)  {TicTacToe::Cell.new(coordinate: coordinate_1_2)}
  let(:cell_2_0)  {TicTacToe::Cell.new(coordinate: coordinate_2_0)}
  let(:cell_2_1)  {TicTacToe::Cell.new(coordinate: coordinate_2_1)}
  let(:cell_2_2)  {TicTacToe::Cell.new(coordinate: coordinate_2_2)}

  before do
    allow(subject).to receive(:open_positions).and_return([cell_0_0,cell_0_1,cell_0_2])
  end


  describe "grid info" do

    before do
      allow(subject).to receive(:get_grid_size).and_return(3)
      subject.build_grid_info
    end

    it "should have grid build" do
      expect(subject.grid.size).to eq(3)
    end
  end

  describe "Human info" do
    before do
      allow(subject).to receive(:get_name).and_return("Ankit G")
      subject.build_human_info
    end


    it "should have a human name asked" do
      expect(subject.human.name).to eq("Ankit G")
    end

    it "should have a marker asked" do
      expect(subject.human.marker).to eq("X")
    end
  end

  describe "Computer info" do

    before do
      subject.build_computer_info
    end

    it "should have the name harcoded" do
      expect(subject.computer.name).to eq("Ninja")
    end
  end


  describe "formatted open positions" do
    it "should have the hsh for open open_positions" do
      expect(subject.formatted_open_positions).to eq({"1" => [0,0],
                                                      "2" => [0,1],
                                                      "3" => [0,2]})
    end
  end

  describe "open_positions" do
    it "should return open positions" do
      expect(subject.open_positions).to match_array([cell_0_0,cell_0_1,cell_0_2])
    end
  end

  describe "winner?" do
    before do
      allow(grid).to receive(:winner?).with(player).and_return(true)
      allow(subject).to receive(:grid).and_return(grid)
    end

    it "should have the winner via grid" do
      expect(subject.winner?(player)).to be_truthy
    end
  end

  describe "play" do
    it "should set players selection" do
      expect(subject.open_positions[1].value).to be_nil
      subject.play([0,1],player)
      expect(subject.open_positions[1].value).to eq("X")
    end
  end

  describe "auto play" do
    it "should auto play" do
      expect(subject.open_positions.collect {|cell| cell.value}).to match_array([nil,nil,nil])
      subject.auto_play(player)
      expect(subject.open_positions.collect {|cell| cell.value}).to match_array([nil,"X",nil])
    end
  end
end
