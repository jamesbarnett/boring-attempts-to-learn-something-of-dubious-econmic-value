#!/usr/bin/env ruby

puts (0..999).to_a.select {|i|
  i % 3 == 0 || i % 5 == 0
}.inject {|val, acc| val += acc }
