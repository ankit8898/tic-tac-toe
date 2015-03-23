describe TicTacToe::Cell do

  subject {TicTacToe::Cell.new(value: "X",coordinate: [0,1])}

  it "should have a value" do
    expect(subject.value).to eq("X")
  end

  it "should have a coordinate" do
    expect(subject.coordinate).to match_array([0,1])
  end
end
