describe TicTacToe::Coordinate do

  subject {TicTacToe::Coordinate.new(x: 0,y: 1)}

  it "should have a x value" do
    expect(subject.x).to eq(0)
  end

  it "should have a y value" do
    expect(subject.y).to eq(1)
  end

end
