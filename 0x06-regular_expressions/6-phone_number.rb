#!/usr/bin/env ruby
# This script matches the characters

arg = ARGV[0] # gets the first argument from terminal
regex = /^\d{10}(?!\d)/ # creates search pattern

result = arg.scan(regex).join("")

puts result.length > 10 ? "" : result
