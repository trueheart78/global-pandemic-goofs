# frozen_string_literal: true

class Pandemic
  def self.goof
    ['global', [self.concoction, self.business].sample].join ' '
  end

  class << self
    def concoction
      [ self.p_word, self.place ]
    end

    def p_word
      [
        'paladin',
        'pizza',
        'paparazzi',
        'penguin',
        'pipe',
        'pygmy',
        'pineapple',
        'panini',
        'paper clip',
        'pinto bean',
        'package',
        'page',
        'paper',
        'picture',
        'photo',
        'plant',
        'paddlefish'
      ].sample
    end

    def place
      [
        'training camp',
        'armory',
        'factory',
        'warehouse',
        'school',
        'office',
        'law firm',
        'library',
        'study hall',
        'bed',
        'living room',
        'van down by the river',
        'concert hall',
        'phylactery',
        'express',
        'restaurant',
        'park',
        'path',
        'plant'
      ].sample
    end

    def business
      [
        'Panda Express',
        'Papa John\'s',
        'Pizza Hut',
        'Penn Station',
        'Priceline.com',
        'Petsmart',
        'P.F. Chang\'s'
      ].sample
    end
  end
end
