describe TicTacToe::Cell do

  subject {TicTacToe::Cell.new(value: "X")}

  it "should have a value" do
    expect(subject.value).to eq("X")
  end
end
