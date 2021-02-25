# frozen_string_literal: true

require 'files'

class Type
  def initialize
    @files = Files.weighted_list.shuffle
  end

  def detect_type
    identify_weights
    type = @weightings.keys.sample

    number = rand(1..@total_lines)
    @files.each do |filename|
      next unless @weightings.key? filename

      if (@weightings[filename][:start]..@weightings[filename][:end]).member? number
        type = filename
        break
      end
    end

    type
  end

  private

  def identify_weights
    reset_vars

    @files.each do |file|
      start_at = @total_lines + 1
      line_count = lines(file)
      if line_count > 0
        @total_lines += line_count
        @weightings[file] = {start: start_at, end: @total_lines}
      end
    end
  end

  def reset_vars
    @weightings = {}
    @total_lines = 0
  end

  def lines(file)
    `wc -l data/#{file}.txt`.to_i
  end
end

