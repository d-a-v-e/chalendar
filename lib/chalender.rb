require "chalender/version"
require 'thor'

module Chalender
  class Error < StandardError; end
  
  class CLI < Thor
    desc 'time', 'tells the time!'
    def time
      puts Time.now
    end

    desc 'print-squares [number]', 'prints squares'
    def print_squares(num = 14, max_columns = 7)
      num = num.to_i
      max_columns = max_columns.to_i
      remainder = num % 7
      rows = num / max_columns
      while rows > 0
        puts Array.new(max_columns + 1, '[]')
        rows = rows - 1
      end
      puts Array.new(remainder + 1, '[]') unless remainder.zero?
    end
  end
end

Chalender::CLI.start(ARGV)
