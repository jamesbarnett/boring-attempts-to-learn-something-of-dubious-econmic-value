#!/usr/bin/env ruby -w

def factorial n
  (1..n).inject :* || 1
end

def f x
  factorial(2 * x)/(factorial(x) * factorial(x))
end

puts "f(2): #{f(2)}"
puts "f(3): #{f(3)}"
puts "f(20): #{f(20)}"
