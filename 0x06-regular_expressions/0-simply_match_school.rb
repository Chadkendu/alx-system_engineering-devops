#!/usr/bin/env ruby
# This script matches the word "School" passed as an argument

arg = ARGV[0] # gets the first argument from terminal
regex = /[S]chool/ # creates search pattern

matches = arg.scan(regex)
puts matches.join("")

