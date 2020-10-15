# frozen_string_literal: true

require 'bundler'
Bundler.require

# Game Class
class Game
  attr_accessor :player1, :player2, :board

  def initialize(name_p1, name_p2)
    @player1 = Player.new(name_p1, 'X')
    @player2 = Player.new(name_p2, 'O')
    @board = Board.new
  end

  def check_pos(line, row)
    if line.between?(0, 2) && row.between?(0, 2)
      @board.board[line][row] == ' '
    else
      false
    end
  end

  def play(player, pos)
    row = (pos[0].capitalize.ord - 17).chr.to_i
    line = pos[1].to_i - 1
    if check_pos(line, row)
      @board.board[line][row] = player.symbol
    else
      puts 'Try again'
      turn(player)
    end
  end

  def turn(player)
    @board.show_board
    puts "Turn of #{player.name}, you play as #{player.symbol}"
    puts 'Where do you want to play ?'
    puts 'Example is if you want to play in A1, type a1'
    pos = gets.chomp
    play(player, pos)
  end

  def check_row
    tab = @board.board
    3.times do |x|
      return true if tab[0][x] == tab[1][x] && tab[1][x] == tab[2][x] && tab[1][x] != ' '
    end
    false
  end

  def check_line
    @board.board.include?('XXX') || @board.board.include?('OOO')
  end

  def check_diag1
    board = @board.board
    diag2 = board[2][0] + board[1][1] + board[0][2]
    diag2.include?('XXX') || diag2.include?('OOO')
  end

  def check_diag2
    board = @board.board
    diag1 = board[0][0] + board[1][1] + board[2][2]
    diag1.include?('XXX') || diag1.include?('OOO')
  end

  def check_diag
    check_diag1 || check_diag2
  end

  def over?
    check_row || check_line || check_diag
  end
end
