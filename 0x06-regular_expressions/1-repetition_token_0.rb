#!/usr/bin/env ruby
# This script matches the characters passed as an argument

arg = ARGV[0] # gets the first argument from terminal
regex = /hbt{2,5}n/ # creates search pattern for characters

matches = arg.scan(regex)
puts matches.join("")
