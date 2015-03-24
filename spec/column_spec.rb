describe TicTacToe::Column do

  let(:cell_one)   {TicTacToe::Cell.new(value: "X",coordinate: TicTacToe::Coordinate.new(x: 0,y: 0))}
  let(:cell_two)   {TicTacToe::Cell.new(value: "X",coordinate: TicTacToe::Coordinate.new(x: 0,y: 1))}
  let(:cell_three) {TicTacToe::Cell.new(value: "X",coordinate: TicTacToe::Coordinate.new(x: 0,y: 2))}

  subject {TicTacToe::Column.new(position: 0,cells: [cell_one,cell_two,cell_three])}

  it "should have a position" do
    expect(subject.position).to eq(0)
  end

  it "should have cells" do
    expect(subject.cells).to match_array([cell_one,cell_two,cell_three])
  end

end
