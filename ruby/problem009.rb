#!/usr/bin/env ruby

xs = (1..1000).to_a.combination(3).select do |x|
  x.first + x[1] + x.last == 1000 && x.first ** 2 + x[1] ** 2 == x.last ** 2
end.first

puts "a: #{xs.first}, b: #{xs[1]}, c: #{xs.last}"
puts xs.first * xs[1] * xs.last
