# frozen_string_literal: true

require 'type'

class Pandemic
  def self.goof
    "In this #{self.adjective} #{self.noun}?"
  end

  class << self
    def type
      Type.new.detect_type
    end

    def adjective
      File.readlines('data/adjectives.txt').sample.chomp
    end

    def noun
      current_type = self.type

      [
        File.readlines("data/#{current_type}.txt").sample.chomp,
        self.place(current_type)
      ].compact.join ' '
    end

    def place(current_type)
      return if current_type == :businesses

      File.readlines('data/places.txt').sample.chomp
    end
  end
end
