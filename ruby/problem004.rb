#!/usr/bin/env ruby

def palindrome?(x)
  x.to_s == x.to_s.reverse
end

max = 0
max_x = 100
max_y = 100
(100..999).to_a.reverse.each do |x|
  (100..999).to_a.reverse.each do |y|
    val = x * y
    if palindrome?(val) && val > max
      max = val
      max_x = x
      max_y = y
    end
  end
end

puts max
