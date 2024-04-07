require_relative "Players"

class Board
  attr_accessor :arr
  def initialize()
    @arr = Array.new(4) { Array.new(5)}
  end

  def insert_values(marker,index)
    arrays = self.arr
    if (arrays[0][index]!=nil)
        return "the column is already filled"
    elsif(arrays[1][index]!=nil)
            arrays[0][index]=marker
    elsif(arrays[2][index]!=nil)
        arrays[1][index] = marker
    elsif(arrays[3][index]!=nil)
      arrays[2][index] = marker
    else
    arrays[3][index] = marker
    end
    return self
  end

  def check_winner(playerA,playerB)
    return "Player 1 is the winner"
  end

end

# p "Enter the First player's name and marker"
# player1 = Players.new(gets.chomp, gets.chomp)
# p "Enter the Second player's name and marker"
# player2 = Players.new(gets.chomp, gets.chomp)

# c = Board.new
# p " Please enter the positon you would like to insert the first person marker"
# i = gets.chomp.to_i
# c.insert_values(player1.marker, i-1)
# p c
# p " Please enter the positon you would like to insert the second person marker"
# i = gets.chomp.to_i
# c.insert_values(player2.marker,i-1)
# p c
# p " Please enter the positon you would like to insert the first person marker"
# i = gets.chomp.to_i
# c.insert_values(player1.marker,i-1)
# p c
# p " Please enter the positon you would like to insert the second person marker"
# i = gets.chomp.to_i
# c.insert_values(player2.marker,i-1)
# p c
