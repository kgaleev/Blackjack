# frozen_string_literal: true

class Card

  attr_reader :rank, :suit
  attr_accessor :points
  #if there will be nothing other than init, possible to delete class, put Card = Struct.new(:rank, :suit, :points) in module
  def initialize(rank, suit, points)
    @rank = rank
    @suit = suit
    @points = points
  end

end