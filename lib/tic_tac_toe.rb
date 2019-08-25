# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  i = 0 
  until i == 9 
  turn (board)
  i += 1 
end
end

def turn_count (board)
  x = 0 
  board.each do |position|
    if position == "X" || position == "O"
      x += 1 
    end
  end 
  return x 
end 

#objective is to deduce whose turn it is, leveraging the fact that we know how many turns have happened already 
def current_player(board)
    if turn_count(board) % 2 == 0 || turn_count(board) == 0 
      return "X"
    else
      return "O"
    end
  end 
 
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6],
  [1, 4, 7], 
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]
  
  def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      position_taken?(board, combo[0]) && board(combo[0]) == board(combo[1]) && board(combo[1]) == board(combo[2])
    end
  end 
  
  def full?(board)
    board.all?{|tolken| token == "X" || token =="O"}
  end
  
  def draw?(board)
    full?(board) && !won?(board)
  end
  
  def over?(borad)
    won?(board) || full?(board)
  end
  
  def winner(board)
    if won?(board)
      winning_combo = won?(board)
      board[winning_combo[0]]
    end 
  end 

def play(board)
  turn(board) until over?
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elseif draw?(board)
    puts "Cat's Game!"
  end
end 