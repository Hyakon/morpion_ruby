# frozen_string_literal: false

require 'bundler'
Bundler.require

# Class Board
class Board
  attr_accessor :board

  def initialize
    # @board = ['abc', 'def', 'ghj']
    @board = ['   ', '   ', '   ']
  end

  def show_board
    no_line = 0
    puts '  |A|B|C|'
    @board.each do |line|
      no_line += 1
      print "#{no_line} |"
      line.each_char do |row|
        print "#{row}|"
      end
      puts
    end
  end
end
