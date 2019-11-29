class Game
  attr_accessor :board,:player_1,:player_2
  WIN_COMBINATIONS = [
      [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
    ] 
    
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def won?
   won = WIN_COMBINATIONS.map do |combo|
          return combo if board.cells[combo[0]] != " " && board.cells[combo[0]]  == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
       end.compact.flatten
    won if !won.empty?
  end
  
  def draw?
     !won? && board.full?
  end
  
  def over?
     won? || draw?
  end
  
  def winner
    board.cells[won?.first] if won?
  end
  
  def turn 
    input = current_player.move(board)
    current_player.move(board) if !board.valid_move?(input) 
    board.update(input, current_player)
  end
  
  def play
    turn until over?
    board.update(player_1.move(board),player_1) if board.turn_count == 1
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
  
end


