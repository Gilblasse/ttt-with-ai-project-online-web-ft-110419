module Players
  class Computer < Player
    
    def move(board)
      board.cells.map.with_index(1){|v,i| v == " " ? "#{i}" : v}.grep(/\d/)
    end
    
  end
end