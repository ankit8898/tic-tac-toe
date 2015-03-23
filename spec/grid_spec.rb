describe TicTacToe::Grid do

  subject {TicTacToe::Grid.new(rows: 3,columns: 3)}

  describe "Rows and columns" do
    it "should have rows" do
      expect(subject.rows).to eq(3)
    end

    it "should have columns" do
      expect(subject.columns).to eq(3)
    end
  end

  describe "coordinates" do
    it "should build the coordinates" do
      expect(subject.coordinates).to match_array([[0,0],[0,1],[0,2],
                                                  [1,0],[1,1],[1,2],
                                                  [2,0],[2,1],[2,2]])
    end
  end

  describe "Cells" do
    it "should have cells via coordinates" do
      expect(subject.cells.collect(&:coordinate)).to match_array([[0,0],[0,1],[0,2],
                                                                  [1,0],[1,1],[1,2],
                                                                  [2,0],[2,1],[2,2]])
    end

    it "should have n number of cells" do
      expect(subject.cells).to have(9).items
    end
  end
end
