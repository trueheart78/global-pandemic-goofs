# frozen_string_literal: true

class Files
  def self.full_list
    %i(adjectives places).concat self.weighted_list
  end

  def self.weighted_list
    %i(businesses animals foods fruits drinks vegetables objects professions sports)
  end

  def self.lines(file_type)
    `wc -l data/#{file_type}.txt`.to_i
  end
end
