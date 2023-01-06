# frozen_string_literal: true

class Dealer < Player
  def initialize
    super(name='Dealer')
  end

  def make_turn(deck_object)
    if scores.sum >= 17
      puts "Dealer skips"
    elsif scores.sum < 17
      puts "Dealer draws a card"
      draw_one(deck_object)
    end
  end
end