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
      puts header
      num = num.to_i
      max_columns = max_columns.to_i
      remainder = num % 7
      rows = num / max_columns
      while rows > 0
        puts Array.new(max_columns + 1, '[]').join(' ')
        rows = rows - 1
      end
      puts Array.new(remainder, '[]').join(' ') unless remainder.zero?
    end


    private

    def header(padding = 5)
      padding = Array.new(padding, ' ').join
      date = Time.now.strftime('%B %Y')
      puts "#{padding}#{date}"
    end
  end
end

Chalender::CLI.start(ARGV)
