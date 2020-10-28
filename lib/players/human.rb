module Players
  class Human < Player

attr_accessor :input

    def move(board)
      input = gets.chomp
      input
    end

  end
end
