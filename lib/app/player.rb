# frozen_string_literal: true

require 'bundler'
Bundler.require

# Class Player
class Player
  attr_accessor :name
  attr_accessor :symbol
  attr_reader :players

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
