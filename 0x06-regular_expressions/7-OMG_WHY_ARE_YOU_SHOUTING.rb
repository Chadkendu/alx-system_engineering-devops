#!/usr/bin/env ruby
# This script matches the uppercase letters

arg = ARGV[0] # gets the first argument from terminal
regex = /[A-Z]/ # creates the search pattern

matches = arg.scan(regex)
puts matches.join("")
