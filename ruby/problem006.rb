#!/usr/bin/env ruby

vals = (1..100).to_a

sum_of_squares = vals.inject {|acc, x| acc += x ** 2 }
square_of_sums = vals.inject {|acc, x| acc + x } ** 2

puts square_of_sums - sum_of_squares
