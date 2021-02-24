# frozen_string_literal: true

class Pandemic
  def self.goof
    [self.g_adjective, [self.concoction, self.business].sample].join ' '
  end

  class << self
    def concoction
      [ self.p_word, self.place ]
    end

    def g_adjective
      [
        'global',
        'gawky',
        'garish',
        'gaudy',
        'gassy',
        'gentle',
        'genital',
        'geothermal',
        'general',
        'germfree',
        'ghostly',
        'goulish',
        'ghastly',
        'gilded',
        'glamourous',
        'gleaming',
        'glossy',
        'gloomy',
        'glowing',
        'glorified',
        'glued',
        'glittering',
        'glorious',
        'gluttonous',
        'gnarly',
        'gold',
        'gooey',
        'gossipy',
        'golden',
        'goofy',
        'gorgeous',
        'gothic',
        'godforsaken',
        'goosey',
        'gratuitous',
        'grilled',
        'grotesque',
        'gruesome',
        'grumpy',
        'grim',
        'gritty',
        'gruff',
        'grungy',
        'graceless',
        'grand',
        'graphical',
        'gratifying',
        'greased',
        'grimy',
        'grizzled',
        'groovy',
        'grumbling',
        'grating',
        'grieving',
        'grizzly',
        'grueling',
        'gradual',
        'grainy',
        'grandiose',
        'grassy',
        'grisly',
        'groggy',
        'gruelling',
        'guarded',
        'gutless',
        'gummy',
        'gutsy',
        'gyroscopic'
      ].sample
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
        'paddlefish',
        'pony'
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

    def item
      [
        # concat this with place to then take a sample?
        'album', # is this really worth it?
      ]
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
