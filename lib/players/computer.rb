module Players
  class Computer < Player
    
    def move(board)
      # board.cells.map.with_index(1){|v,i| v == " " ? "#{i}" : v}.grep(/\d/)
       (1..9).to_a.sample.to_s
    end
    
  end
end