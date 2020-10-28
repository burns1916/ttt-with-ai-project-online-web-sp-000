class Board

  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 4, 8],
                      [2, 4, 6],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8]]

attr_accessor :cells

@cells = []

def initialize
  self.cells = Array.new(9, " ")
end

def reset!
  self.cells = Array.new(9, " ")
end

def display
 puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
 puts "-----------"
 puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
 puts "-----------"
 puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

def position(input)
  index = input.to_i - 1
  return self.cells[index]
end

def full?
  self.cells.none?{|i| i == " "}
end

def turn_count
  turn = 0
  self.cells.each do |cells_move|
    if cells_move == "X" || cells_move == "O"
      turn +=1
    end
  end
  return turn
end

def taken?(input)
  index = input.to_i - 1
  if self.cells[index] == "" || self.cells[index] == " " || self.cells[index] == nil
    false
  else
    true
  end
end

def valid_move?(input)
  if input.to_i.between?(1, 9) && !taken?(input)
    true
  else
    false
  end
end

def win_game?(symbol)
  WIN_COMBINATIONS.any? do |combo|
    return true if combo.all? { |a| @cells[a] == symbol }
  end
end

def update(input, player)
  index = input.to_i - 1
  self.cells[index] = player.token
end

end
