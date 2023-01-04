# frozen_string_literal: true

class Player
  attr_accessor :cards, :balance, :name
  #through self. in init -- writer is needed, through @ -- not
  #change name to reader when finished
    def initialize(name)
      self.name = name.capitalize
      self.balance = 100
      self.cards = []

    end

  def place_bet
    self.balance-=10
  end

  def get_bet
    self.balance+=20
  end

  def draw
    self.balance+=10
  end


end