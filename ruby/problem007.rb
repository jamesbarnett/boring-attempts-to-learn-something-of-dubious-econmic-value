#!/usr/bin/env ruby

require "prime"

n = 10_001
limit = (n * Math.log(n) + n * (Math.log(Math.log(n)))).ceil
primes = []

Prime.each(limit) do |p|
  primes << p
  break if primes.size == n
end

puts "The 10,001st prime: "
puts primes.last
