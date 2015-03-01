#!/usr/bin/env ruby

require "prime"

val = 600851475143

puts Prime.prime_division(val).max {|x, y| x.first <=> y.first }.first
