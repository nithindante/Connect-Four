 require_relative '../lib/Board'
 require_relative '../lib/Players'
 require 'stringio'

describe Board do
  subject(:board) { Board.new }
  let(:player1) { instance_double(Players,marker:"X")}
  let(:player2) { instance_double(Players,marker:"O")}
  #let(:i) { StringIO.new('Larry') }
  describe "#insert_values" do
    it 'inserts a value to the Board to the first column when the board is empty' do
    newBoard = board.insert_values(player1.marker,0)
    expect(board).to be(newBoard)
    end

    it "inserts a value to the Board when the same positon is filled" do
      board.insert_values(player1.marker,0)
      newBoard = board.insert_values(player1.marker,0)
      expect(newBoard.arr).to eq([[nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil], ["X", nil, nil, nil, nil], ['X', nil, nil, nil, nil]])
    end
  end

  describe "#check_winner" do
    it 'Reports the winner if the board has any of its column as the same marker throughout' do
      board.insert_values(player1.marker,0)
      board.insert_values(player1.marker,0)
      board.insert_values(player1.marker,0)
      board.insert_values(player1.marker,0)
      expect(board.check_winner(player1,player2)).to eq("Player 1 is the winner")
    end
  end
end
