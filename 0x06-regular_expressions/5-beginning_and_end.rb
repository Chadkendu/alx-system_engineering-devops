#!/usr/bin/env ruby
# This script matching the string that starts with h ends
# with n and can have any single character between

arg = ARGV[0] # gets the first argument from terminal
regex = /h.n/ # creates the search pattern

matches = arg.scan(regex)
puts matches.join("")
