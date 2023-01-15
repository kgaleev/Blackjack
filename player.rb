# frozen_string_literal: true

class Player

  #  include Menu
  def self.draw_index=(draw_index); @@draw_index = draw_index; end #writer
  def self.draw_index; @@draw_index; end #reader

  @@draw_index=0

  attr_accessor :balance, :cards, :name, :scores
  #through self. in init -- writer is needed, through @ -- not
  #change name to reader when finished
  #if name will be needed for dealer, delete intro, bring back init(name)
    def initialize(name)
      #intro
      # self.name = name.capitalize
      self.balance = 100
      self.cards = []
      @name = name

    end

  def place_bet
    self.balance-=10
  end

  def win_bet
    self.balance+=20
  end

  def draw_bet
    self.balance+=10
  end

  # def intro #put into Game
  #   if self.class == Player
  #   puts "What's your name?"
  #   name = gets.chomp
  #   @name = name.capitalize
  #   end
  # end

  def draw_two(deck_object) #get 2 cards
    2.times do draw_one(deck_object)

    end
  end

  def draw_one(deck_object) #get 1 card #change all_cards to deck and vise versa
    self.cards << deck_object.deck[self.class.draw_index]
    self.class.draw_index+=1
    self.scores = []
    cards.each do |card|
      self.scores << card.points
      end
  end

  def current_score #method name and variable name should differ to not get stack level too deep
    # self.scores = []
    # cards.each do |card|
    #   self.scores << card.points
    # end
    while scores.sum > 21 && (scores.include? 11)
      self.scores[scores.index {|score| score == 11}] = 1
    end
    puts "#{name}'s scores: #{scores.sum}"
  end

  def beautiful_cards
    print "#{name}'s cards: "
    cards.each {|card| print card.rank + card.suit + " "}; puts
  end
end