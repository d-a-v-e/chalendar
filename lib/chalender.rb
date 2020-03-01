require "chalender/version"
require 'thor'

module Chalender
  class Error < StandardError; end
  
  class CLI < Thor
    desc "time", "tells the time!"
    def time
      puts Time.now
    end
  end
end

Chalender::CLI.start(ARGV)
