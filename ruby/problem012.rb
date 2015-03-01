#!/usr/bin/env ruby -w

require "prime"

def triangle n
  (0..n).inject {|x, y| x + y }
end

def factors n
  primes, powers = n.prime_division.transpose
  exponents = powers.map {|i| (0..i).to_a }
  divisors = exponents.shift.product(*exponents).map do |ps|
    primes.zip(ps).map { |prime, power|
      prime ** power
    }.inject(:*)
  end

  divisors.sort.map {|div| [div, n / div] }.uniq.sort
end

i = 1000
ds = nil
t = nil
max_ds = 0

loop do
  t = triangle i
  ds = factors t
  if ds.size > max_ds
    max_ds = ds.size
  end
  break if ds.size > 500
  i += 1
end

puts "t = #{t}, ds count = #{ds.size}"
