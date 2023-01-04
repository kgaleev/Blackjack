# frozen_string_literal: true

class Deck

  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SUITS = %w[♦ ♠ ♥ ♣]

  attr_reader :rank, :suit, :points, :deck

  #Card = Struct.new(:rank, :suit, :points)

  #name.deck[number].rank to get rank
  def initialize
    @deck = [] #change deck to cards
    RANKS.each do |rank|
      SUITS.each do |suit|
        @deck << Card.new(rank, suit, points)
      end
    end
  end

  def ptc # points_to_cards
    @deck.each do |card|
      case card.rank
      when '2'
        card.points = 2
      when '3'
        card.points = 3
      when '4'
        card.points = 4
      when '5'
        card.points = 5
      when '6'
        card.points = 6
      when '7'
        card.points = 7
      when '8'
        card.points = 8
      when '9'
        card.points = 9
      when '10', 'J', 'Q', 'K'
        card.points = 10
      when 'A'
        card.points = 11
      end
    end
  end

  def shuffle
    @deck = @deck.shuffle # .shuffle doesn't change original array
  end

end