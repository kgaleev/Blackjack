# frozen_string_literal: true

class Player

  def self.draw_index=(draw_index); @@draw_index = draw_index; end #writer
  def self.draw_index; @@draw_index; end #reader

  @@draw_index=0

  attr_accessor :balance, :cards, :name
  #through self. in init -- writer is needed, through @ -- not
  #change name to reader when finished
  #if name will be needed for dealer, delete intro, bring back init(name)
    def initialize #(name)
      intro
      # self.name = name.capitalize
      self.balance = 100
      self.cards = []

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

  def intro #put into Game
    if self.class == Player
    puts "What's your name?"
    name = gets.chomp
    @name = name.capitalize
    end
  end

  def draw_two(cards) #get 2 cards
    2.times do draw_one(cards)

    end
  end

  def draw_one(cards) #get 1 card #change cards to deck and vise versa
    self.cards << cards.deck[self.class.draw_index]
    self.class.draw_index+=1

  end


end