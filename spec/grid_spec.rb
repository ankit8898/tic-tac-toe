describe TicTacToe::Grid do

  subject {TicTacToe::Grid.new(size: 3)}
  let(:player) {TicTacToe::Human.new(name: 'Ankit',marker: 'X')}


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

  context "Winner / loser" do

    let(:coordinate_0_0) {TicTacToe::Coordinate.new(x: 0,y: 0)}
    let(:coordinate_0_1) {TicTacToe::Coordinate.new(x: 0,y: 1)}
    let(:coordinate_0_2) {TicTacToe::Coordinate.new(x: 0,y: 2)}
    let(:coordinate_1_0) {TicTacToe::Coordinate.new(x: 1,y: 0)}
    let(:coordinate_1_1) {TicTacToe::Coordinate.new(x: 1,y: 1)}
    let(:coordinate_1_2) {TicTacToe::Coordinate.new(x: 1,y: 2)}
    let(:coordinate_2_0) {TicTacToe::Coordinate.new(x: 2,y: 0)}
    let(:coordinate_2_1) {TicTacToe::Coordinate.new(x: 2,y: 1)}
    let(:coordinate_2_2) {TicTacToe::Coordinate.new(x: 2,y: 2)}

    describe "winner via row" do

      let(:cell_0_0)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_0_0)}
      let(:cell_0_1)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_0_1)}
      let(:cell_0_2)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_0_2)}
      let(:cell_1_0)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_1_0)}
      let(:cell_1_1)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_1_1)}
      let(:cell_1_2)  {TicTacToe::Cell.new(coordinate: coordinate_1_2)}
      let(:cell_2_0)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_2_0)}
      let(:cell_2_1)  {TicTacToe::Cell.new(coordinate: coordinate_2_1)}
      let(:cell_2_2)  {TicTacToe::Cell.new(coordinate: coordinate_2_2)}
      let(:row_one)   {TicTacToe::Row.new(position: 0,cells: [cell_0_0,cell_0_1,cell_0_2])}
      let(:row_two)   {TicTacToe::Row.new(position: 0,cells: [cell_1_0,cell_1_1,cell_1_2])}
      let(:row_three) {TicTacToe::Row.new(position: 0,cells: [cell_2_0,cell_2_1,cell_2_2])}

      before do
        allow(subject).to receive(:rows).and_return([row_one,row_two,row_three])
      end

      it "should find winner in row" do
        expect(subject.winner_via_row?(player)).to be_truthy
      end
    end

    describe "no winner via row" do

      let(:cell_0_0)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_0)}
      let(:cell_0_1)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_0_1)}
      let(:cell_0_2)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_0_2)}
      let(:cell_1_0)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_1_0)}
      let(:cell_1_1)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_1_1)}
      let(:cell_1_2)  {TicTacToe::Cell.new(coordinate: coordinate_1_2)}
      let(:cell_2_0)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_2_0)}
      let(:cell_2_1)  {TicTacToe::Cell.new(coordinate: coordinate_2_1)}
      let(:cell_2_2)  {TicTacToe::Cell.new(coordinate: coordinate_2_2)}
      let(:row_one)   {TicTacToe::Row.new(position: 0,cells: [cell_0_0,cell_0_1,cell_0_2])}
      let(:row_two)   {TicTacToe::Row.new(position: 0,cells: [cell_1_0,cell_1_1,cell_1_2])}
      let(:row_three) {TicTacToe::Row.new(position: 0,cells: [cell_2_0,cell_2_1,cell_2_2])}

      before do
        allow(subject).to receive(:rows).and_return([row_one,row_two,row_three])
      end

      it "should find winner in row" do
        expect(subject.winner_via_row?(player)).to be_falsey
      end
    end

    describe "winner via column" do

      let(:cell_0_0)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_0_0)}
      let(:cell_0_1)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_1)}
      let(:cell_0_2)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_2)}
      let(:cell_1_0)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_1_0)}
      let(:cell_1_1)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_1_1)}
      let(:cell_1_2)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_1_2)}
      let(:cell_2_0)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_2_0)}
      let(:cell_2_1)  {TicTacToe::Cell.new(coordinate: coordinate_2_1)}
      let(:cell_2_2)  {TicTacToe::Cell.new(coordinate: coordinate_2_2)}
      let(:column_one)   {TicTacToe::Column.new(position: 0,cells: [cell_0_0,cell_1_0,cell_2_0])}
      let(:column_two)   {TicTacToe::Column.new(position: 0,cells: [cell_0_1,cell_1_1,cell_2_1])}
      let(:column_three) {TicTacToe::Column.new(position: 0,cells: [cell_0_2,cell_1_2,cell_2_2])}

      before do
        allow(subject).to receive(:columns).and_return([column_one,column_two,column_three])
      end

      it "should find winner in columns" do
        expect(subject.winner_via_column?(player)).to be_truthy
      end
    end

    describe "no winner via column" do

      let(:cell_0_0)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_0)}
      let(:cell_0_1)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_1)}
      let(:cell_0_2)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_2)}
      let(:cell_1_0)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_1_0)}
      let(:cell_1_1)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_1_1)}
      let(:cell_1_2)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_1_2)}
      let(:cell_2_0)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_2_0)}
      let(:cell_2_1)  {TicTacToe::Cell.new(coordinate: coordinate_2_1)}
      let(:cell_2_2)  {TicTacToe::Cell.new(coordinate: coordinate_2_2)}
      let(:column_one)   {TicTacToe::Column.new(position: 0,cells: [cell_0_0,cell_1_0,cell_2_0])}
      let(:column_two)   {TicTacToe::Column.new(position: 0,cells: [cell_0_1,cell_1_1,cell_2_1])}
      let(:column_three) {TicTacToe::Column.new(position: 0,cells: [cell_0_2,cell_1_2,cell_2_2])}

      before do
        allow(subject).to receive(:columns).and_return([column_one,column_two,column_three])
      end

      it "should find winner in columns" do
        expect(subject.winner_via_column?(player)).to be_falsey
      end
    end

    describe "winner via diagonal" do

      let(:cell_0_0)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_0_0)}
      let(:cell_0_1)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_1)}
      let(:cell_0_2)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_2)}
      let(:cell_1_0)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_1_0)}
      let(:cell_1_1)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_1_1)}
      let(:cell_1_2)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_1_2)}
      let(:cell_2_0)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_2_0)}
      let(:cell_2_1)  {TicTacToe::Cell.new(coordinate: coordinate_2_1)}
      let(:cell_2_2)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_2_2)}
      let(:diagonal_one)   {TicTacToe::Column.new(position: 0,cells: [cell_0_0,cell_1_1,cell_2_2])}
      let(:diagonal_two)   {TicTacToe::Column.new(position: 1,cells: [cell_0_2,cell_1_1,cell_0_2])}


      before do
        allow(subject).to receive(:diagonals).and_return([diagonal_one,diagonal_two])
      end

      it "should find winner in diagonals" do
        expect(subject.winner_via_diagonal?(player)).to be_truthy
      end
    end

    describe "no winner via diagonal" do

      let(:cell_0_0)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_0)}
      let(:cell_0_1)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_1)}
      let(:cell_0_2)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_0_2)}
      let(:cell_1_0)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_1_0)}
      let(:cell_1_1)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_1_1)}
      let(:cell_1_2)  {TicTacToe::Cell.new(value: '0',coordinate: coordinate_1_2)}
      let(:cell_2_0)  {TicTacToe::Cell.new(value: 'X',coordinate: coordinate_2_0)}
      let(:cell_2_1)  {TicTacToe::Cell.new(coordinate: coordinate_2_1)}
      let(:cell_2_2)  {TicTacToe::Cell.new(coordinate: coordinate_2_2)}
      let(:column_one)   {TicTacToe::Column.new(position: 0,cells: [cell_0_0,cell_1_0,cell_2_0])}
      let(:diagonal_one)   {TicTacToe::Column.new(position: 0,cells: [cell_0_0,cell_1_1,cell_2_2])}
      let(:diagonal_two)   {TicTacToe::Column.new(position: 1,cells: [cell_0_2,cell_1_1,cell_0_2])}

      before do
        allow(subject).to receive(:diagonals).and_return([diagonal_one,diagonal_two])
      end

      it "should find winner in diagonals" do
        expect(subject.winner_via_diagonal?(player)).to be_falsey
      end
    end
  end


  context "winner?" do

    describe "when because of row" do
      before do
        allow(subject).to receive(:winner_via_row?).with(player).and_return(true)
      end

      it "should be a winner" do
        expect(subject.winner?(player)).to be_truthy
      end
    end

    describe "when because of column" do
      before do
        allow(subject).to receive(:winner_via_column?).with(player).and_return(true)
      end

      it "should be a winner" do
        expect(subject.winner?(player)).to be_truthy
      end
    end

    describe "when because of diagonal" do
      before do
        allow(subject).to receive(:winner_via_diagonal?).with(player).and_return(true)
      end

      it "should be a winner" do
        expect(subject.winner?(player)).to be_truthy
      end
    end
  end
end
