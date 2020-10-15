# frozen_string_literal: true

require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'app/player'
require 'app/board'
require 'app/game'

# Class Application
class Application
  attr_reader :application, :game, :winner, :loop

  def ask_name(number)
    puts "Player#{number} enter your name"
    gets.chomp
  end

  def create_game(player1, player2)
    @game = Game.new(player1, player2)
    puts "#{game.player1.name} is created, you play as #{game.player1.symbol}"
    puts "#{game.player2.name} is created, you play as #{game.player2.symbol}"
  end

  def victory(player)
    @game.board.show_board
    if @loop == 9
      puts 'ITS A DRAW'
    elsif @winner == 1
      puts "VICTORY #{game.player1.name} YOU WON"
    else
      puts "VICTORY #{game.player2.name} YOU WON"
    end
  end

  def run_game
    @loop = 0
    until game.over? || @loop == 9
      @winner = 1
      @game.turn(game.player1)
      @loop += 1
      next if @game.over? || @loop == 9

      @winner = 2
      @game.turn(game.player2)
      @loop += 1
    end
  end

  def perform
    player1 = ask_name(1)
    player2 = ask_name(2)
    again = '1'
    while again == '1'
      create_game(player1, player2)
      run_game
      victory(winner)
      puts 'Type 1 to continue'
      again = gets.chomp
    end
  end
end

Application.new.perform
