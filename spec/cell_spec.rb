describe TicTacToe::Cell do

  subject {TicTacToe::Cell.new(value: "X",coordinate: [0,1])}

  it "should have a value" do
    expect(subject.value).to eq("X")
  end

  it "should have a coordinate" do
    expect(subject.coordinate).to match_array([0,1])
  end


  describe "available / occupied" do

    let(:cell_1) {TicTacToe::Cell.new(coordinate: [0,1])}
    let(:cell_2)  {TicTacToe::Cell.new(value: "X",coordinate: [0,1])}

    it "should be available?" do
      expect(cell_1.available?).to be_truthy
      expect(cell_1.occupied?).to be_falsey
    end

    it "should be occupied?" do
      expect(cell_2.available?).to be_falsey
      expect(cell_2.occupied?).to be_truthy
    end
  end
end
