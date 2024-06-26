require_relative "Players"

class Board
  attr_accessor :arr
  def initialize()
    @arr = Array.new(4) { Array.new(5)}
  end

  def insert_values(marker,index)
    arrays = self.arr
    if (arrays[0][index]!=nil)
        p "the column is already filled"
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

  def check_winner
    arr = self.arr
    newArr = []
    selfArr = []
    for i in 0..arr.length - 1 do
      for j in 0..arr.length do
        if j < 2
          newArr.push(arr[i][j])
          newArr.push(arr[i][j + 1])
          newArr.push(arr[i][j + 2])
          newArr.push(arr[i][j + 3])
          selfArr.push(newArr)
          newArr = []
        end
        if i < 1
          newArr.push(arr[i][j])
          newArr.push(arr[i + 1][j])
          newArr.push(arr[i + 2][j])
          newArr.push(arr[i + 3][j])
          selfArr.push(newArr)
          newArr = []
        end
        if j < 2 && (i < 1)
          newArr.push(arr[i][j])
          newArr.push(arr[i + 1][j + 1])
          newArr.push(arr[i + 2][j + 2])
          newArr.push(arr[i + 3][j + 3])
          selfArr.push(newArr)
          newArr = []
        end
        next unless i == 0 && (j > 2)

        newArr.push(arr[i][j])
        newArr.push(arr[i + 1][j - 1])
        newArr.push(arr[i + 2][j - 2])
        newArr.push(arr[i + 3][j - 3])
        selfArr.push(newArr)
        newArr = []
      end
    end
    selfArr
  end

  def check_who_is_the_winner

    combos_arr = check_winner
    combos_arr.each do |element|
      if element[0]==element[1]
        if element[1]==element[2]
          if element[2]==element[3]
            return element[2]
          end
        end
      end
    end
  end
end


  def check_result(result,player1,player2)
    if result == player1.marker
      return 1
    elsif result == player2.marker
      return 2
    end
  end

p "Enter the First player's name and marker"
player1 = Players.new(gets.chomp, gets.chomp)
p "Enter the Second player's name and marker"
player2 = Players.new(gets.chomp, gets.chomp)
connect_four_board = Board.new

  def enter_values(player,connect_four_board)
    p "Please enter the position you would like for #{player.name}"
    i = gets.chomp.to_i
    while (c.insert_values(player.marker, i-1).to_s).eql?("the column is already filled")
      p " Please enter the positon you would like to again insert the first person marker"
      i = gets.chomp.to_i
      c.insert_values(player.marker, i-1)
    end
  end

for n in 0..19
  enter_values(player1,connect_four_board)
  result = c.check_who_is_the_winner
  if check_result(result,player1,player2) == 1
    p "Player 1 is the winner"
    return
  elsif check_result(result,player1,player2) == 2
    p "Player 2 is the winner"
    return
  end
  enter_values(player2,connect_four_board)
  result = c.check_who_is_the_winner
  if check_result(result,player1,player2) == 1
    p "Player 1 is the winner"
    return
  elsif check_result(result,player1,player2) == 2
    p "Player 2 is the winner"
    return
  end
end
