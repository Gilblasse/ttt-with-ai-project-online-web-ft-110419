class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "---------------------------------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "---------------------------------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    i = input.to_i - 1
    @cells[i]
  end
  
  def full?
    !@cells.any? " "
  end
  
  def turn_count
    cells.count {|cell| cell != " "}
  end
  
  def taken?(input)
    i = input.to_i - 1
    @cells[i] != " "
  end
  
  def valid_move?(input)
    i = input.to_i - 1
    !taken?(input) && i.between?(0,8)
  end
  
  def update(input, token)
    i = input.to_i - 1
    @cells[i] = token.token
  end
  
end



