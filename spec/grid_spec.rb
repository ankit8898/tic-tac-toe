describe TicTacToe::Grid do

  subject {TicTacToe::Grid.new(size: 3)}


  describe "coordinates" do
    it "should build the coordinates" do
      expect(subject.coordinates.collect {|i| [i.x,i.y]}).to match_array([[0,0],[0,1],[0,2],
                                                                          [1,0],[1,1],[1,2],
                                                                          [2,0],[2,1],[2,2]])
      expect(subject.coordinates).to have(9).item
    end
  end

  describe "diagonal coordinates" do
    it "should build the diagonal_one_coordinates" do
      expect(subject.diagonal_coordinates[:diagonal_one_coordinates]).to match_array([[0,0],[1,1],[2,2]])
    end

    it "should build the diagonal_two_coordinates" do
      expect(subject.diagonal_coordinates[:diagonal_two_coordinates]).to match_array([[0,2],[1,1],[2,0]])
    end
  end

  describe "Cells" do
    it "should have cells via coordinates" do
      expect(subject.cells.collect(&:coordinate)).to  have(9).items
    end

    it "should have n number of cells" do
      expect(subject.cells).to have(9).items
    end
  end

  describe "rows" do

    it "should find grouped_rows" do
      expect(subject.rows).to have(3).items
      expect(subject.rows.collect(&:position)).to match_array([0,1,2])
    end
  end

  describe "columns" do

    it "should find columns" do
      expect(subject.columns).to have(3).items
      expect(subject.columns.collect(&:position)).to match_array([0,1,2])
    end
  end


  describe "diagonals" do

    it "should find diagonals" do
      expect(subject.diagonals).to have(2).items
      expect(subject.diagonals.collect(&:position)).to match_array([0,1])
    end

    it "first diagonal" do
      expect(subject.diagonals[0].cells).to have(3).items
      expect(subject.diagonals[0].cells.collect {|cell| [cell.coordinate.x,cell.coordinate.y]}).to match_array([[0,0],[1,1],[2,2]])
    end

    it "second diagonal" do
      expect(subject.diagonals[1].cells).to have(3).items
      expect(subject.diagonals[1].cells.collect {|cell| [cell.coordinate.x,cell.coordinate.y]}).to match_array([[0,2],[1,1],[2,0]])
    end
  end

  describe "Open positions" do

    it "should give the open positions" do
      expect(subject.open_positions).to have(9).items
    end
  end
end
