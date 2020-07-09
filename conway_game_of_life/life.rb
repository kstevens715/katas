class Life
  attr_accessor :board

  def initialize(board)
    self.board = full_board(board)
  end

  def next_step
    new_board = []
    board.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        next if row_index == 0 || row_index == board.length - 1
        next if column_index == 0 || column_index == board[0].length - 1

        small_board =  [
          board[row_index-1][column_index-1..column_index+1],
          board[row_index][column_index-1..column_index+1],
          board[row_index+1][column_index-1..column_index+1],
        ]
        new_board = next_step_for_cell(small_board)
      end
    end
    new_board
  end

  def next_step_for_cell(_)
    if neighbor_count(board) == 2
      1
    else
      0
    end
  end

  private

  def full_board(small_board)
    width = small_board[0].length
    small_board.unshift([0] * width)
    small_board << [0] * width
    small_board.map do |row|
      [0] + row + [0]
    end
  end

  def neighbor_count(board)
    board = [
      board[0],
      [board[1][0], board[1][2]],
      board[2]
    ].flatten.sum
  end
end
