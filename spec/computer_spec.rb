describe TicTacToe::Computer do

  subject {TicTacToe::Computer.new(marker: "X")}

  it "should have a marker" do
    expect(subject.marker).to eq("X")
  end

  it "should have a type" do
    expect(subject.type).to eq("Computer")
  end

  it "should have a name" do
    expect(subject.name).to eq("Ninja")
  end
end
