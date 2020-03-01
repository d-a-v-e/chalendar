require 'chalender/version'
require 'thor'
require 'date'

module Chalender
  class Error < StandardError; end
  
  class CLI < Thor
    desc 'cal', 'displays a visual calendar'
    def cal
      header
      array_pad = Array.new(month_start_weekday - 1, '  ')
      days_with_padding = array_pad.concat [*'01'..last_day.to_s]
      days_with_padding.each_slice(7) do |week|
        puts highlight_cal_day(week).join(' ')
      end
    end

    private

    def highlight_cal_day(week)
      week.collect do |day|
        if day.to_i == cal_day
          "\e[7m#{day}\e[27m"
        else
          day
        end
      end
    end

    def month_start_weekday
      Date.new(year, month, 1).cwday
    end

    def header
      puts "#{padding}#{Date.today.strftime('%B %Y')}"
      puts 'Mo Tu We Th Fr Sa Su'
    end

    def padding(amount = 5)
      Array.new(amount, ' ').join
    end

    def last_day
      Date.new(year, month, -1).day
    end

    def cal_day
      Date.today.day
    end

    def month
      Date.today.month
    end

    def year
      Date.today.year
    end
  end
end

Chalender::CLI.start(ARGV)
