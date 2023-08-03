#!/usr/bin/env ruby
# This script matches the characters

arg = ARGV[0] # gets the first argument from terminal
regex = /hbt*n/ # creates the search pattern

matches = arg.scan(regex)
puts matches.join("")
