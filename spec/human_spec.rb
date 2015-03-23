describe TicTacToe::Human do

  subject {TicTacToe::Human.new(marker: "X",name: "Ankit G")}

  it "should have a marker" do
    expect(subject.marker).to eq("X")
  end

  it "should have a type" do
    expect(subject.type).to eq("Human")
  end

  it "should have a name" do
    expect(subject.name).to eq("Ankit G")
  end
end
